require 'formula'

class Tcserver < Formula
  homepage 'http://www.gopivotal.com/?q=pivotal-products/pivotal-application-cloud-fabric/pivotal-tc-server'
  url 'http://public.pivotal.com.s3.amazonaws.com/releases/tcserver/2.9.3.RELEASE/tcserver-2.9.3.RELEASE-developer.tar.gz'
  sha1 '2c4b412aa5c78c03a0193e13eb6eb44304dd21a7'
  version "2.9.3"
  
  # logs, lib and temp folder need to exist for base template to work
  skip_clean 'libexec/templates/base/logs'
  skip_clean 'libexec/templates/base/lib'
  skip_clean 'libexec/templates/base/temp'
  
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
    prefix.install %w{ README.txt licenses/VMware_EULA_20120515b_English.txt licenses/vfabric-tc-server-developer-open-source-licenses-2.9.3.RELEASE.txt}
    libexec.install Dir['*']
    bin.install_symlink Dir["#{libexec}/*.sh"]
    
    # logs, lib and temp folder need to exist for base template to work
    (libexec/'templates/base/logs').mkpath
    (libexec/'templates/base/lib').mkpath
    (libexec/'templates/base/temp').mkpath
  end

  def caveats; <<-EOS.undent
    
    Usage:
       To create a new tc Server instance (in current directory):
          tcruntime-instance.sh create myinstance
          
       To create a new tc Server instance with Spring Insight monitoring:
          tcruntime-instance.sh create -t insight myinstance 
       
       To control tc Server instance (in current directory):
          tcruntime-ctl.sh myinstance start
          
    Documentation:
       https://www.vmware.com/support/pubs/vfabric-tcserver.html

    EOS
  end
end
