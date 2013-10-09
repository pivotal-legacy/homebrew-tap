require 'formula'

class Gemfire < Formula
  homepage 'http://gopivotal.com/pivotal-products/data/pivotal-gemfire'
  url 'http://bitcast-a.v1.sjc1.bitgravity.com/greenplum/GemFire/vFabric_GemFire_701_b40235.zip'
  sha1 '03d1fe2ed5233e576f81a1d10270273d9f09d1f9'
  version "7.0.1"
  
  def install
    countries = ["IRAN", "SUDAN", "CUBA", "NORTH KOREA", "SYRIA", "DEMOCRATIC PEOPLE'S REPUBLIC OF KOREA"]
    print "Enter your country: "
    until !(country = STDIN.gets.chomp).empty?
    end
    if countries.include?country.upcase
        puts "You are prohibited from downloading our software according to our software license agreement. If you feel you have received this message in error, please send an email to info@gopivotal.com"
        exit 0
    end
    puts "\nDo you agree to terms and conditions in the Software License Agreement at link below?"
    puts "http://gopivotal.com/pivotal-products/software-license-agreement"
    print "[yes, no] : "
    until !(agree = STDIN.gets.chomp).empty?
    end
    if agree.downcase != 'yes'
        puts "\nIn order to install this software you need to agree to terms and conditions in the Software License Agreement."
        exit 0
    end

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
