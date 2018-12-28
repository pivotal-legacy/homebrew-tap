require 'formula'

class Trilogy < Formula
  homepage 'https://github.com/pivotal/trilogy'
  version "0.3.2"
  url "https://github.com/pivotal/trilogy/releases/download/v#{version}/trilogy-#{version}-mac-linux.tgz"
  sha256 "571bc3ab419bb295c9072fa8be2ec731edf6c3f292a011885fb45fdac9d53e46"

  depends_on :java => "1.8"

  def install
    bin.install "trilogy"
    bin.install "trilogy.jar"
  end

  test do
    system "#{bin}/trilogy --help"
  end
end
