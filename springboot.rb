require 'formula'

class Springboot < Formula
  homepage 'https://projects.spring.io/spring-boot/'
  url 'https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/2.0.1.RELEASE/spring-boot-cli-2.0.1.RELEASE-bin.tar.gz'
  version '2.0.1.RELEASE'
  sha256 '230c33a954b50b64b22e8337c2d2e802c2d9d507fddc9484a5839ecc8998b1a8'
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
