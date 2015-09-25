require 'formula'

class GreenplumDb < Formula
  homepage 'http://www.pivotal.io/big-data/pivotal-greenplum-database'
  url 'http://dist.vfabric.com.s3.amazonaws.com/greenplum-db-4.2.8.0.tar.gz'
  sha1 'a26df9bf2649f6083f19a44c42a84065448450a3'

  resource 'gpdbctl' do
    tapdir = File.dirname(__FILE__)
    extdir = File.basename(__FILE__, ".rb")
    url "file:///#{File.join(tapdir, extdir, "gpdbctl")}"
    sha1 '23e1062dd0a6633c33b8018dd79a206ef0ad2c74'
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

    1. Enable remote login:
           System Preferences -> Sharing -> Check "Remote Login"
      
    2. GreenplumDB requires modification to the OS X kernel parameters.
       To have me make those for you, run:
           gpdbctl kernel

    3. Before GreenplumDB daemon can be started, its data directory and master
       database need to be initialized.
       To have me initialize those for you, run:
           gpdbctl init

    4. To start and stop GreenplumDB, run:
           gpdbctl start|stop

    EOS
    return s
  end

end
