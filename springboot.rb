require 'formula'

class Springboot < Formula
	homepage 'http://projects.spring.io/spring-boot/'
	url 'https://repo.spring.io/milestone/org/springframework/boot/spring-boot-cli/1.0.0.RC1/spring-boot-cli-1.0.0.RC1-bin.tar.gz'
	version '1.0.0.RC1'
	sha1 'fcb6b29c550ce94b49da05453ea23b1fca29a691'
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
