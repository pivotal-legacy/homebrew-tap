require 'formula'

class Gemfire < Formula
  homepage 'http://www.pivotal.io/big-data/pivotal-gemfire'
  url 'http://download.pivotal.com.s3.amazonaws.com/gemfire/9.10.7/pivotal-gemfire-9.10.7.tgz'
  sha256 'a54b57adfafcb7fa1c578ab6d2d21b1df54453ee4f71739cfd2a6fb2a4ac5208'
  version '9.10.7'

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    rm_f "bin/gfsh.bat"
    prefix.install %w{ VMware-EULA open_source_licenses.txt }
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
