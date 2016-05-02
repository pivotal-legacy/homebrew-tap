require 'formula'

class PivnetCli < Formula
  homepage 'https://github.com/pivotal-cf-experimental/go-pivnet'
  version "0.0.10"
  url "https://github.com/pivotal-cf-experimental/go-pivnet/releases/download/v#{version}/pivnet-darwin-amd64-#{version}"
  sha256 "2e835aed4dbc5811c6b1aefa22cf24f13e1a878ed1fe83f46b5f802b557c72c5"

  depends_on :arch => :x86_64

  def install
    mv "pivnet-darwin-amd64-#{version}", "pivnet"
    bin.install "pivnet"
  end

  test do
    system "#{bin}/pivnet"
  end
end
