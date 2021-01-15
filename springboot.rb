require 'formula'

class Springboot < Formula
  homepage 'https://spring.io/projects/spring-boot'
  url 'https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/2.4.1/spring-boot-cli-2.4.1-bin.tar.gz'
  version '2.4.1'
  sha256 '6d7f71f0472a71f8b35ef3759e1d0368b52c9e853e0d1cc2325a8faed45d58b8'
  head 'https://github.com/spring-projects/spring-boot.git'

  if build.head?
    depends_on 'maven' => :build
  end

  def install
    ohai "We've Moved!"

    opoo "Spring Boot has relocated to spring-io/tap"
    opoo ""

    odie """To upgrade Spring Boot, retap it with:
      brew tap spring-io/tap
      brew uninstall springboot
      brew install spring-boot"""
  end
end
