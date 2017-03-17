require 'formula'

class Gemfire < Formula
  homepage 'http://www.pivotal.io/big-data/pivotal-gemfire'
  url 'http://download.pivotal.com.s3.amazonaws.com/gemfire/9.0.2/pivotal-gemfire-9.0.2.zip'
  sha256 '8c7d18163e3048cae79fb11a18006f1426054a3c7e808fa9ed678400ffcce69a'
  version '9.0.2'
  
  bottle :unneeded

  depends_on :java => "1.8"

  def install
    rm_f "bin/gfsh.bat"
    prefix.install %w{ Pivotal-EULA Pivotal-OSL }
    bash_completion.install "bin/gfsh-completion.bash" => "gfsh"
    libexec.install Dir["*"]
    (bin/"gfsh").write_env_script libexec/"bin/gfsh", Language::Java.java_home_env("1.8")
  end

  def caveats; <<-EOS.undent
    By installing, you agree to comply with the license at http://www.pivotal.io/products/software-license-agreement. If you disagree with these terms, please uninstall by typing "brew uninstall gemfire" in your terminal window.

    Usage:
       gfsh

    Documentation:
       http://gemfire.docs.pivotal.io/index.html

    EOS
  end
end
