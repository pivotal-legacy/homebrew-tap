require 'formula'

class Springboot < Formula
  homepage 'https://spring.io/projects/spring-boot'
  url 'https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/2.2.6.RELEASE/spring-boot-cli-2.2.6.RELEASE-bin.tar.gz'
  version '2.2.6.RELEASE'
  sha256 'f2594c453f7a066e8c058f2a078dfd05e9ec0caeb19f58f72a49760a300b014e'
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
