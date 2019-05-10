require 'formula'

class Gemfire < Formula
  homepage 'http://www.pivotal.io/big-data/pivotal-gemfire'
  url 'http://download.pivotal.com.s3.amazonaws.com/gemfire/9.8.1/pivotal-gemfire-9.8.1.tgz'
  sha256 '23482ba3a3c77de629d847485d417c221867c3dd55254fa7b3eba4377dbc3e4d'
  version '9.8.1'
  
  bottle :unneeded

  depends_on :java => "1.8"

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
