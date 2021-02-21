require 'formula'

class Gemfire < Formula
  homepage 'http://www.pivotal.io/big-data/pivotal-gemfire'
  url 'http://download.pivotal.com.s3.amazonaws.com/gemfire/9.10.6/pivotal-gemfire-9.10.6.tgz'
  sha256 '210e0ab95746d2dee4365a65c4650e43bb8cf2074090409562db6a1a50735f3a'
  version '9.10.6'

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
