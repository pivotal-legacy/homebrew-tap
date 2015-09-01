require 'formula'

class CloudfoundryCli < Formula
  homepage 'https://github.com/cloudfoundry/cli'
  head 'https://cli.run.pivotal.io/edge?arch=macosx64&source=homebrew'
  url 'https://cli.run.pivotal.io/stable?release=macosx64-binary&version=6.12.3&source=homebrew'
  version '6.12.3'
  sha1 'd10c532ea711cd0d5549127e378dbc78c3971a92'

  depends_on :arch => :x86_64

  def install
    bin.install 'cf'
  end

  test do
    system "#{bin}/cf"
  end
end
