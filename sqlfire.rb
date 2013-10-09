require 'formula'

class Sqlfire < Formula
  homepage 'http://gopivotal.com/pivotal-products/data/pivotal-sqlfire'
  url 'http://bitcast-a.v1.sjc1.bitgravity.com/greenplum/SQLFire/1.1.1/vFabric_SQLFire_111_b42624.zip'
  sha1 'eef7da9dc5ea53ffe8ed278cad44976b744b687c'
  version "1.1.1"
  
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
    prefix.install %w{ EULA.txt lib/open_source_licenses-VMware_vFabric_SQLFire_1.1.1.txt}
    libexec.install Dir['*']
    bin.write_exec_script libexec/'bin/sqlf'
  end

  def caveats; <<-EOS.undent
    
    Usage:
       sqlf
          
    Documentation:
       https://www.vmware.com/support/pubs/vfabric-sqlfire.html

    EOS
  end
end
