require 'formula'

class Tcserver < Formula
  homepage 'http://tcserver.docs.pivotal.io/index.html'
  url 'http://public.pivotal.com.s3.amazonaws.com/releases/tcserver/3.1.4.RELEASE/tcserver-3.1.4.RELEASE-developer.tar.gz'
  sha1 'a9a4a13477c732837e31702c78fa80c76028b89f'
  version "3.1.4"
  
  # logs, lib and temp folder need to exist for base template to work
  skip_clean 'libexec/templates/base/logs'
  skip_clean 'libexec/templates/base/lib'
  skip_clean 'libexec/templates/base/temp'
  
  def install
    # Remove Windows scripts
    rm_rf Dir['**/*.bat']

    # Install files
    prefix.install %w{ README.txt licenses/Pivotal_EULA.txt licenses/open-source-licenses.txt}
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
          tcruntime-instance.sh create myinstance
          
       To create a new tc Server instance with Spring Insight monitoring:
          tcruntime-instance.sh create -t insight myinstance 
       
       To control tc Server instance (in current directory):
          tcruntime-ctl.sh myinstance start
          
    Documentation:
       http://tcserver.docs.pivotal.io/

    For inquiries about commercial licensing, support, training, and consulting, please contact us at tcserver@pivotal.io
    EOS
  end
end
