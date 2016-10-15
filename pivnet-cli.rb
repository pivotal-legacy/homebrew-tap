require 'formula'

class PivnetCli < Formula
  homepage 'https://github.com/pivotal-cf/go-pivnet'
  version "0.0.30"
  url "https://github.com/pivotal-cf/go-pivnet/releases/download/v#{version}/pivnet-darwin-amd64-#{version}"
  sha256 "c0243a57434235c8b1d9d6fb1f92f6c6c13e7156641d1e2b3fbdf70d2e2855cd"

  depends_on :arch => :x86_64

  def install
    mv "pivnet-darwin-amd64-#{version}", "pivnet"
    bin.install "pivnet"
  end

  test do
    system "#{bin}/pivnet"
  end
end
