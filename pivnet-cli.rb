require 'formula'

class PivnetCli < Formula
  homepage 'https://github.com/pivotal-cf-experimental/go-pivnet'
  version "0.0.18"
  url "https://github.com/pivotal-cf-experimental/go-pivnet/releases/download/v#{version}/pivnet-darwin-amd64-#{version}"
  sha256 "a5c5d4ffd952497bdf9b05f71b16e0b988d947f436fba854b85993432fa5551e"

  depends_on :arch => :x86_64

  def install
    mv "pivnet-darwin-amd64-#{version}", "pivnet"
    bin.install "pivnet"
  end

  test do
    system "#{bin}/pivnet"
  end
end
