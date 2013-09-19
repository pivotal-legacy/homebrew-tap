require 'formula'

class Gemfire < Formula
  homepage 'http://gopivotal.com/pivotal-products/data/pivotal-gemfire'
  url 'http://bitcast-a.v1.sjc1.bitgravity.com/greenplum/GemFire/vFabric_GemFire_701_b40235.zip'
  sha1 '03d1fe2ed5233e576f81a1d10270273d9f09d1f9'
  version "7.0.1"
  
  def install
    # Remove Windows scripts
    rm_rf Dir['**/*.bat']

    # Install files
    prefix.install %w{ EULA.txt lib/open_source_licenses-VMware_vFabric_GemFire_7.0.1.txt}
    libexec.install Dir['*']
    bin.write_exec_script libexec/'bin/agent'
    bin.write_exec_script libexec/'bin/cacheserver'
    bin.write_exec_script libexec/'bin/gemfire'
    bin.write_exec_script libexec/'bin/gfsh'
  end

  def caveats; <<-EOS.undent
    By installing, you agree to comply with the license at http://gopivotal.com/pivotal-products/software-license-agreement. If you disagree with these terms, please uninstall by typing "brew uninstall gemfire" in your terminal window.
    
    Usage:
       gfsh
       cacheserver
       gemfire
       agent
          
    Documentation:
       https://www.vmware.com/support/pubs/vfabric-gemfire.html
    EOS
  end
end
