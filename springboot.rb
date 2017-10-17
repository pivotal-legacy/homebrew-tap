require 'formula'

class Springboot < Formula
  homepage 'http://projects.spring.io/spring-boot/'
  url 'https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/1.5.8.RELEASE/spring-boot-cli-1.5.8.RELEASE-bin.tar.gz'
  version '1.5.8.RELEASE'
  sha256 '422608ab63fa05bf8806b5ee2bea4fdf1a270f3780252e57b18c9010f37f4230'
  head 'https://github.com/spring-projects/spring-boot.git'

  if build.head?
    depends_on 'maven' => :build
  end

  def install
    if build.head?
      Dir.chdir('spring-boot-cli') { system 'mvn -U -DskipTests=true package' }
      root = 'spring-boot-cli/target/spring-boot-cli-*-bin/spring-*'
    else
      root = '.'
    end

    bin.install Dir["#{root}/bin/spring"]
    lib.install Dir["#{root}/lib/spring-boot-cli-*.jar"]
    bash_completion.install Dir["#{root}/shell-completion/bash/spring"]
    zsh_completion.install Dir["#{root}/shell-completion/zsh/_spring"]
  end
end
