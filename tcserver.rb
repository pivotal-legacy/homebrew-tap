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
    By installing, you agree to comply with the license at http://gopivotal.com/software-developer-edition-eula. If you disagree with these terms, please uninstall by typing "brew uninstall tcserver" in your terminal window.
 
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
