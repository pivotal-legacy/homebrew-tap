require 'formula'

class Springboot < Formula
  homepage 'http://projects.spring.io/spring-boot/'
  url 'https://repo.spring.io/milestone/org/springframework/boot/spring-boot-cli/0.5.0.M5/spring-boot-cli-0.5.0.M5-bin.tar.gz'
  version '0.5.0.M5'
  sha1 '5f2b6eddbed59bbb54bd8390b71586f1d9a9515f'

  def install
    bin.install 'bin/spring'
    lib.install 'lib/spring-boot-cli-0.5.0.M5.jar'
    bash_completion.install 'bash_completion.d/spring'
  end
end
