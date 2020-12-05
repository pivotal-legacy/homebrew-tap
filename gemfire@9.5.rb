require 'formula'

class GemfireAT95 < Formula
  homepage 'http://www.pivotal.io/big-data/pivotal-gemfire'
  url 'http://download.pivotal.com.s3.amazonaws.com/gemfire/9.5.4/pivotal-gemfire-9.5.4.zip'
  sha256 'a64d834c674aa8dab7099e33d0490f4741f786b8c7f1801c9f44857f6d0b6868'
  version '9.5.4'
  
  bottle :unneeded

  depends_on ":openjdk@8"

  def install
    rm_f "bin/gfsh.bat"
    prefix.install %w{ Pivotal-EULA Pivotal-OSL }
    bash_completion.install "bin/gfsh-completion.bash" => "gfsh"
    libexec.install Dir["*"]
    (bin/"gfsh").write_env_script libexec/"bin/gfsh", Language::Java.java_home_env("1.8")
  end

  def caveats; <<~EOS
    By installing, you agree to comply with the license at https://network.pivotal.io/pivotal_software_eula. If you disagree with these terms, please uninstall by typing "brew uninstall gemfire" in your terminal window.

    Usage:
       gfsh

    Documentation:
       http://gemfire.docs.pivotal.io/index.html

    EOS
  end
end
