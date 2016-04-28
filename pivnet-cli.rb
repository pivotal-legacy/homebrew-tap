require 'formula'

class PivnetCli < Formula
  homepage 'https://github.com/pivotal-cf-experimental/go-pivnet'
  version "0.0.9"
  url "https://github.com/pivotal-cf-experimental/go-pivnet/releases/download/v#{version}/pivnet-darwin-amd64-#{version}"
  sha256 "2453708a7fd0ecb0ccaf33c4334614148bde0bbfc48ffa27e8e023007053c350"

  depends_on :arch => :x86_64

  def install
    mv "pivnet-darwin-amd64-#{version}", "pivnet"
    bin.install "pivnet"
  end

  test do
    system "#{bin}/pivnet"
  end
end
