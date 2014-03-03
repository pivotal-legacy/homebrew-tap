require 'formula'

class GreenplumDb < Formula
  homepage 'http://gopivotal.com/products/pivotal-greenplum-database'
  url 'http://dist.vfabric.com.s3.amazonaws.com/greenplum-db-4.2.2.4.tgz'
  sha1 '0e66a34da5bb361ebd917a737ec98483c64c4eae'
  version "4.2.2.4"
  
  def install
    # Install files
    prefix.install Dir['*']
    safe_system "ln -sf #{prefix} /usr/local/greenplum-db-#{version}"
    safe_system "ln -sf #{prefix} /usr/local/greenplum-db"
  end

  def caveats; <<-EOS.undent

GreenplumDB formula is currently a beta version and UNSUPPORTED. Use it at your own risk.
By installing, you agree to comply with the license at http://www.gopivotal.com/pivotal-products/software-license-agreement. If you disagree with these terms, please uninstall by typing "brew uninstall greenplum-db".

To configure and start GreenplumDB please run following:
    /usr/local/greenplum-db/install-gpdb.sh


To stop and uninstall GreenplumDB please run following:
    /usr/local/greenplum-db/stop-gpdb.sh
    brew uninstall greenplum-db

EOS
  end
end
