require 'formula'

class Tcserver < Formula
  homepage 'http://tcserver.docs.pivotal.io/index.html'
  url 'http://public.pivotal.com.s3.amazonaws.com/releases/tcserver/3.2.9.RELEASE/tcserver-3.2.9.RELEASE-developer.tar.gz'
  sha256 'dc11b2ae496b8e2d15eb317878e2e5b8be82fca8d16ef083aea7461f07fabac1'
  version "3.2.9"
  
  # logs, lib and temp folder need to exist for base template to work
  skip_clean 'libexec/templates/base/logs'
  skip_clean 'libexec/templates/base/lib'
  skip_clean 'libexec/templates/base/temp'
  
  def install
    # Remove Windows scripts
    rm_rf Dir['**/*.bat']

    # Install files
    prefix.install %w{ README.txt licenses/Pivotal_EULA.txt }
    libexec.install Dir['*']
    bin.install_symlink Dir["#{libexec}/*.sh"]
    
    # logs, lib and temp folder need to exist for base template to work
    (libexec/'templates/base/logs').mkpath
    (libexec/'templates/base/lib').mkpath
    (libexec/'templates/base/temp').mkpath
  end

  def caveats; <<-EOS.undent
    By installing, you agree to comply with the license at https://network.pivotal.io/pivotal_software_eula. If you disagree with these terms, please uninstall by typing "brew uninstall tcserver" in your terminal window.
 
    Usage:
       To create a new tc Server instance (in current directory):
          > tcruntime-instance.sh create myinstance
          
       To create a new tc Server instance with Spring Insight monitoring:
       
          Retrieve the Spring Insight Developer template from the Template Repository:
             > tcruntime-admin.sh get-template spring-insight-developer
          Create the instance with the Spring Insight template name:
             > tcruntime-instance.sh create myinstance -t insight 
       
       To control tc Server instance (in current directory):
          > tcruntime-ctl.sh myinstance start
          
    Documentation:
       http://tcserver.docs.pivotal.io/
    
    Open Source License:
       https://network.pivotal.io/open-source

    For inquiries about commercial licensing, support, training, and consulting, please contact us at tcserver@pivotal.io
    EOS
  end
end
