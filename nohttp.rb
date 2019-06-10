require 'formula'

class Nohttp < Formula
  desc 'Guard against using "http" calls in your code'
  homepage 'https://github.com/spring-io/nohttp'
  url 'https://repo.maven.apache.org/maven2/io/spring/nohttp/nohttp-cli/0.0.2.RELEASE/nohttp-cli-0.0.2.RELEASE.jar'
  version '0.0.2.RELEASE'
  sha256 'f9b366f1b02cff33d9e4c0d23d160d2f17a8dff96ffab7790e54d460bd3d2a78'

  def install
    libexec.install "nohttp-cli-0.0.2.RELEASE.jar" => "nohttp"
    (bin/"nohttp").write runner
    (bin/"nohttp").chmod 0755
  end

  def runner; <<-EOS
#!/bin/bash
java -jar "#{libexec}/nohttp" "$@"
    EOS
  end
end
