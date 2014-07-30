require 'formula'

class CloudfoundryCli < Formula
  homepage 'https://github.com/cloudfoundry/cli'
  head 'https://cli.run.pivotal.io/edge?arch=macosx64&source=homebrew'
  url 'https://cli.run.pivotal.io/stable?release=macosx64-binary&version=6.3.2&source=homebrew'
  version '6.3.2'
  sha1 '795b51184959cd3fe6e50f97d371585b8f5c31f5'

  depends_on :arch => :x86_64

  def install
    bin.install 'cf'
  end

  test do
    system "#{bin}/cf"
  end
end
