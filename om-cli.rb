require 'formula'

class OmCli < Formula
  homepage 'https://github.com/pivotal-cf/om'
  version "1.0.0"
  url "https://github.com/pivotal-cf/om/releases/download/#{version}/om-darwin"
  sha256 "80e517219d52111d8f4376d4c8ba832f0013d7f8b0accce2b3448b24ce78db53"

  depends_on :arch => :x86_64

  def install
    mv "om-darwin", "om"
    bin.install "om"
  end

  test do
    system "#{bin}/om"
  end
end
