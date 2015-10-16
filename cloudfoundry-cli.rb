require 'formula'

class CloudfoundryCli < Formula
  homepage 'https://github.com/cloudfoundry/cli'
  head 'https://cli.run.pivotal.io/edge?arch=macosx64&source=homebrew'
  url 'https://cli.run.pivotal.io/stable?release=macosx64-binary&version=6.13.0&source=homebrew'
  version '6.13.0'
  sha1 'df324bffecae135f42a6d20b2501b898669a107e'

  depends_on :arch => :x86_64

  def install
    bin.install 'cf'
  end

  test do
    system "#{bin}/cf"
  end
end
