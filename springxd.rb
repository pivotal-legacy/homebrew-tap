require 'formula'

class Springxd < Formula
  homepage 'http://projects.spring.io/spring-xd/'
  url 'http://repo.spring.io/libs-release-local/org/springframework/xd/spring-xd/1.1.0.RELEASE/spring-xd-1.1.0.RELEASE-dist.zip' , :using => :curl
  sha1 '34a439f7449554e36a868d4312334ae59360fe5d'
  version "1.1.0.RELEASE"

  depends_on 'redis' => :optional
  depends_on 'rabbitmq' => :optional
  depends_on 'zookeeper' => :optional

  def install
    # Remove Windows scripts
    rm_rf Dir['**/*.bat']

    # Install files
    libexec.install Dir['*']
    bin.install_symlink Dir["#{libexec}/shell/bin/*"]
    bin.install_symlink Dir["#{libexec}/xd/bin/*"]
    bin.install_symlink Dir["#{libexec}/gemfire/bin/*"]
    bin.install_symlink Dir["#{libexec}/hsqldb/bin/*"]
  end

  def caveats; <<-EOS.undent

   Usage:
    To start XD single node (runs in foreground):
        xd-singlenode

    To start XD admin and container separately (all run in foreground):
        brew update && brew install redis
        brew install zookeeper
        redis-server
        hsqldb-server
        zkServer start
        xd-admin
        xd-container

    Start XD Shell:
        xd-shell

    Create your first stream by typing following in xd shell:
        xd:> stream create --definition "time | log" --name ticktock

    Documentation:
       http://docs.spring.io/spring-xd/docs/1.1.0.RELEASE/reference/html/

    EOS
  end
end
