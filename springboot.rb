require 'formula'

class Springboot < Formula
  homepage 'http://projects.spring.io/spring-boot/'
  url 'https://repo.spring.io/milestone/org/springframework/boot/spring-boot-cli/0.5.0.M6/spring-boot-cli-0.5.0.M6-bin.tar.gz'
  version '0.5.0.M6'
  sha1 '5f6c2d6a99cb923191b00d3524f2b586db98e7e3'

  def install
    bin.install 'bin/spring'
    lib.install 'lib/spring-boot-cli-0.5.0.M6.jar'
    bash_completion.install 'bash_completion.d/spring'
  end
end
