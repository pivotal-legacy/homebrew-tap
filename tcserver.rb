require 'formula'

class Tcserver < Formula
  homepage 'http://tcserver.docs.pivotal.io/index.html'
  url 'http://public.pivotal.com.s3.amazonaws.com/releases/tcserver/4.0.3.RELEASE/tcserver-4.0.3.RELEASE-developer.tar.gz'
  sha256 'e163ec6920021ba6e33c4c6a9677851c2c47451bd52a8b32d93f602876450f32'
  version '4.0.3'

  def install
    rm_rf Dir['**/*.bat']
    distDir = "developer-#{version}.RELEASE"
    %w(README.txt licenses/Pivotal_EULA.txt).each do |readme|
      prefix.install ["#{distDir}/#{readme}"]
    end
    libexec.install Dir['*']
    bin.install_symlink Dir["#{libexec}/#{distDir}/tcserver"]
    tcsInstancesDir = var.join('tcserver').join('instances')
    tcsInstancesDir.mkpath
    IO.write("#{libexec}/#{distDir}/conf/tcserver.properties",
             "instances.directory=#{tcsInstancesDir}\n", mode: 'a')
  end

  def caveats; <<-EOS
    By installing, you agree to comply with the license at https://network.pivotal.io/pivotal_software_eula.
    If you disagree with these terms, please uninstall by typing "brew uninstall tcserver" in your terminal window.

    Usage:
       To create a new tc Server instance:
          > tcserver create myinstance

       To control tc Server instance:
          > tcserver start|stop|restart|status myinstance

    Documentation:
       http://tcserver.docs.pivotal.io/

    Open Source License:
       https://network.pivotal.io/open-source

    For inquiries about commercial licensing, support, training, and consulting, please contact us at:
       mailto:tcserver@pivotal.io
    EOS
  end
end
