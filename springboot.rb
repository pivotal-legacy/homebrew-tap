require 'formula'

class Springboot < Formula
	homepage 'http://projects.spring.io/spring-boot/'
	url 'https://repo.spring.io/milestone/org/springframework/boot/spring-boot-cli/0.5.0.M7/spring-boot-cli-0.5.0.M7-bin.tar.gz'
	version '0.5.0.M7'
	sha1 'c4a0ae98da62fbaaf96e3004e6982b74247b3ca0'
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
