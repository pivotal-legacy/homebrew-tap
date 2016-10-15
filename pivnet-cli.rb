require 'formula'

class PivnetCli < Formula
  homepage 'https://github.com/pivotal-cf/go-pivnet'
  version "0.0.29"
  url "https://github.com/pivotal-cf/go-pivnet/releases/download/v#{version}/pivnet-darwin-amd64-#{version}"
  sha256 "0f614bd6c978d438d261be88b960246b91c0a30c295a63413b1331977bb7b0c1"

  depends_on :arch => :x86_64

  def install
    mv "pivnet-darwin-amd64-#{version}", "pivnet"
    bin.install "pivnet"
  end

  test do
    system "#{bin}/pivnet"
  end
end
