require 'formula'

class Springxd < Formula
  homepage 'http://projects.spring.io/spring-xd/'
  url 'http://deq44nzfzkcur.cloudfront.net/simple/libs-milestone-local/org/springframework/xd/spring-xd/1.0.0.M4/spring-xd-1.0.0.M4-dist.zip'
  sha1 'b86e0c61fe7a44e064c7411852df748217db31c8'
  version "1.0.0.M4"
  
  depends_on 'redis' => :optional
  depends_on 'rabbitmq' => :optional

  def install
    # Remove Windows scripts
    rm_rf Dir['**/*.bat']

    # Install files
    libexec.install Dir['*']
    bin.install_symlink Dir["#{libexec}/shell/bin/*"]
    bin.install_symlink Dir["#{libexec}/xd/bin/*"]
  end

  def caveats; <<-EOS.undent

   Usage:
    To start XD single node (runs in foreground): 
    xd-singlenode

    To start XD admin and container separately (all run in foreground):
    redis-server
    xd-admin
    xd-container

    Start XD Shell:
    xd-shell

    Create your first stream by typing following in xd shell: 
    xd:> stream create --definition "time | log" --name ticktock
    
    Documentation:
       http://docs.spring.io/spring-xd/docs/1.0.0.M4/reference/html

    EOS
  end
end
