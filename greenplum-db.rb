require 'formula'

class GreenplumDb < Formula
  homepage 'http://www.pivotal.io/big-data/pivotal-greenplum-database'
  url 'http://chris.cheetham.com/gpdb/greenplum-db-4.2.8.0.tar.gz'
  sha1 'a26df9bf2649f6083f19a44c42a84065448450a3'

  resource 'gpdbctl' do
    url 'http://chris.cheetham.com/gpdb/gpdbctl'
    sha1 '7a037635031f7515ba32e6fb54b5d786a3d15690'
  end

  def install
    libexec.install Dir['*']
    resource('gpdbctl').stage { bin.install 'gpdbctl' }
    inreplace "#{bin}/gpdbctl", /%%GPDATA%%/,\
      "#{ENV["HOMEBREW_PREFIX"]}/var/greenplum"
    inreplace "#{bin}/gpdbctl", /%%GPHOME%%/, "#{libexec}"
    inreplace "#{libexec}/greenplum_path.sh", /%%GPHOME%%/, "#{libexec}"
    inreplace "#{libexec}/bin/lib/gp_bash_functions.sh", /gnutar/, "tar"
  end

  def caveats
    s = <<-EOS.undent

    GreenplumDB formula is currently a beta version and UNSUPPORTED. Use it at
    your own risk.
 
    By installing, you agree to comply with the license at:
        http://www.pivotal.io/products/software-license-agreement
 
    If you disagree with these terms, please uninstall by typing:
        brew uninstall greenplum-db

    Next steps:

    GreenplumDB requires modification to the OS X kernel parameters.
    To have this script make those for you, run
        gpdbctl kernel

    Before GreenplumDB daemon can be started, its data directory and master
    database need to be initialized.
    To have this script initialize those for you, run
        gpdbctl init

    To start and stop GreenplumDB, run
        gpdbctl start|stop

    EOS
    return s
  end

end
