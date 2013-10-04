require 'formula'

class Sqlfire < Formula
  homepage 'http://gopivotal.com/pivotal-products/data/pivotal-sqlfire'
  url 'http://bitcast-a.v1.sjc1.bitgravity.com/greenplum/SQLFire/1.1.1/vFabric_SQLFire_111_b42624.zip'
  sha1 'eef7da9dc5ea53ffe8ed278cad44976b744b687c'
  version "1.1.1"
  
  def install
    # Remove Windows scripts
    rm_rf Dir['**/*.bat']

    # Install files
    prefix.install %w{ EULA.txt lib/open_source_licenses-VMware_vFabric_SQLFire_1.1.1.txt}
    libexec.install Dir['*']
    bin.write_exec_script libexec/'bin/sqlf'
  end

  def caveats; <<-EOS.undent
    By installing, you agree to comply with the license at http://gopivotal.com/pivotal-products/software-license-agreement. If you disagree with these terms, please uninstall by typing "brew uninstall sqlfire" in your terminal window.
    
    Usage:
       sqlf
          
    Documentation:
       https://www.vmware.com/support/pubs/vfabric-sqlfire.html
    EOS
  end
end
