require 'formula'

class Springboot < Formula
  homepage 'http://projects.spring.io/spring-boot/'
  url 'https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/1.5.6.RELEASE/spring-boot-cli-1.5.6.RELEASE-bin.tar.gz'
  version '1.5.6.RELEASE'
  sha256 'd129e7952f8cc687da436db1fff091991e8b85500894e3bc655ecbda7da6d8ae'
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
