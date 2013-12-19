require 'formula'

class Springboot < Formula
	homepage 'http://projects.spring.io/spring-boot/'
	url 'https://repo.spring.io/milestone/org/springframework/boot/spring-boot-cli/0.5.0.M7/spring-boot-cli-0.5.0.M7-bin.tar.gz'
	version '0.5.0.M7'
	sha1 'c4a0ae98da62fbaaf96e3004e6982b74247b3ca0'

	def install
		bin.install 'bin/spring'
		lib.install 'lib/spring-boot-cli-0.5.0.M7.jar'
		bash_completion.install 'shell-completion/bash/spring'
		zsh_completion.install 'shell-completion/zsh/_spring'
	end
end
