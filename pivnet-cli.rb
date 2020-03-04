require 'formula'

class PivnetCli < Formula
  homepage 'https://github.com/pivotal-cf/pivnet-cli'
  version "1.0.1"
  url "https://github.com/pivotal-cf/pivnet-cli/releases/download/v#{version}/pivnet-darwin-amd64-#{version}"
  sha256 "7c045350f523fc26897f21ad061ffa2a175d2df46817716c573e39e2c84a20c2"

  depends_on :arch => :x86_64

  def install
    mv "pivnet-darwin-amd64-#{version}", "pivnet"
    bin.install "pivnet"
  end

  test do
    system "#{bin}/pivnet"
  end
end
