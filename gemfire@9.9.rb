require 'formula'

class GemfireAT99 < Formula
  homepage 'http://www.pivotal.io/big-data/pivotal-gemfire'
  url 'http://download.pivotal.com.s3.amazonaws.com/gemfire/9.9.3/pivotal-gemfire-9.9.3.tgz'
  sha256 '496508efab462e0a61a5022e9d1ab62150eb5758f90dd197115f20b3d9fd4be4'
  version '9.9.3'

  bottle :unneeded

  depends_on :java => "1.8"

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
