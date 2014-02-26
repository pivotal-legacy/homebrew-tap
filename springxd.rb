require 'formula'

class Springxd < Formula
  homepage 'http://projects.spring.io/spring-xd/'
  url 'http://deq44nzfzkcur.cloudfront.net/simple/libs-milestone-local/org/springframework/xd/spring-xd/1.0.0.M5/spring-xd-1.0.0.M5-dist.zip' , :using => :curl
  sha1 '3d34600b24a2d52fc792ef448a0569a2c88bb8a5'
  version "1.0.0.M5"
  
  depends_on 'redis' => :optional
  depends_on 'rabbitmq' => :optional

  def install
    # Remove Windows scripts
    rm_rf Dir['**/*.bat']

    # Install files
    libexec.install Dir['*']
    bin.install_symlink Dir["#{libexec}/shell/bin/*"]
    bin.install_symlink Dir["#{libexec}/xd/bin/*"]
    bin.install_symlink Dir["#{libexec}/gemfire/bin/*"]
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
       http://docs.spring.io/spring-xd/docs/1.0.0.M5/reference/html

    EOS
  end
end
