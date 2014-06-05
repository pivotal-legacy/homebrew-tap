require 'formula'

class Tcserver < Formula
  homepage 'http://www.gopivotal.com/?q=pivotal-products/pivotal-application-cloud-fabric/pivotal-tc-server'
  url 'http://download.pivotal.com.s3.amazonaws.com/tcserver/2.9.6/vfabric-tc-server-standard-2.9.6.RELEASE.tar.gz'
  sha1 '1fed309cef7ff1a404a71ffc0a616734e08eb0ba'
  version "2.9.6"
  
  # logs, lib and temp folder need to exist for base template to work
  skip_clean 'libexec/templates/base/logs'
  skip_clean 'libexec/templates/base/lib'
  skip_clean 'libexec/templates/base/temp'
  
  def install
    # Remove Windows scripts
    rm_rf Dir['**/*.bat']

    # Install files
    prefix.install %w{ README.txt licenses/VMware_EULA_20120515b_English.txt licenses/vfabric-tc-server-developer-open-source-licenses-2.9.5.SR1.txt}
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

    For inquiries about commercial licensing, support, training, and consulting, please contact us at tcserver@gopivotal.com
    EOS
  end
end
