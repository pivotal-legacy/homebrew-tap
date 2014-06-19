require 'formula'

class CloudfoundryCli < Formula
  homepage 'https://github.com/cloudfoundry/cli'
  head 'https://cli.run.pivotal.io/edge?arch=macosx64'
  url 'https://cli.run.pivotal.io/stable?release=macosx64-binary&version=6.2.0&source=homebrew'
  version '6.2.0'
  sha1 '0e1dea612419ca9e9d6aae985c7c84cc6bb62a38'

  depends_on :arch => :x86_64

  def install
    bin.install 'cf'
  end

  test do
    system "#{bin}/cf"
  end
end
