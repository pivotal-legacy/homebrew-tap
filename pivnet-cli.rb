require 'formula'

class PivnetCli < Formula
  homepage 'https://github.com/pivotal-cf-experimental/go-pivnet'
  version "0.0.16"
  url "https://github.com/pivotal-cf-experimental/go-pivnet/releases/download/v#{version}/pivnet-darwin-amd64-#{version}"
  sha256 "380bcc3d35f7eddd8cded425386dbd7f51229e9527edae9ed1dc6de3307f895b"

  depends_on :arch => :x86_64

  def install
    mv "pivnet-darwin-amd64-#{version}", "pivnet"
    bin.install "pivnet"
  end

  test do
    system "#{bin}/pivnet"
  end
end
