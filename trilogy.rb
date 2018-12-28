require 'formula'

class Trilogy < Formula
  homepage 'https://github.com/pivotal/trilogy'
  version "0.3.2"
  url "https://github.com/pivotal/trilogy/releases/download/v#{version}/trilogy-#{version}-mac-linux.tgz"
  sha256 "1c6f7039da26f0f909cf4daf7b73c9a91f2241c4108a1cdeb072fb5b3732378e"

  depends_on :java => "1.8"

  def install
    bin.install "trilogy"
    bin.install "trilogy.jar"
  end

  test do
    system "#{bin}/trilogy --help"
  end
end
