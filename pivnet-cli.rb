require 'formula'

class PivnetCli < Formula
  homepage 'https://github.com/pivotal-cf/go-pivnet'
  version "0.0.28"
  url "https://github.com/pivotal-cf/go-pivnet/releases/download/v#{version}/pivnet-darwin-amd64-#{version}"
  sha256 "70645e5fa172204f2a52889c57dfd6c237e7bca616d7f1bd87c18c478bda0563"

  depends_on :arch => :x86_64

  def install
    mv "pivnet-darwin-amd64-#{version}", "pivnet"
    bin.install "pivnet"
  end

  test do
    system "#{bin}/pivnet"
  end
end
