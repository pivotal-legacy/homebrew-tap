require 'formula'

class CloudfoundryCli < Formula
  homepage 'https://github.com/cloudfoundry/cli'
  head 'https://cli.run.pivotal.io/edge?arch=macosx64&source=homebrew'
  url 'https://cli.run.pivotal.io/stable?release=macosx64-binary&version=6.11.2&source=homebrew'
  version '6.11.2'
  sha1 'ec8c6bc1585d620fdf6c42f59acec5368bc3e4b9'

  depends_on :arch => :x86_64

  def install
    bin.install 'cf'
  end

  test do
    system "#{bin}/cf"
  end
end
