require 'formula'

class CloudfoundryCli < Formula
  homepage 'https://github.com/cloudfoundry/cli'
  head 'https://cli.run.pivotal.io/edge?arch=macosx64'
  url 'https://cli.run.pivotal.io/stable?release=macosx64-binary&version=6.1.2'
  version '6.1.2'
  sha1 '19df87677b92129f01e339e1f8f043831b6168d3'

  def install
    bin.install 'cf'
  end

  test do
    system "#{bin}/cf"
  end
end
