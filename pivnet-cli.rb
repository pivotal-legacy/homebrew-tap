require 'formula'

class PivnetCli < Formula
  homepage 'https://github.com/pivotal-cf/pivnet-cli'
  version "0.0.76"
  url "https://github.com/pivotal-cf/pivnet-cli/releases/download/v#{version}/pivnet-darwin-amd64-#{version}"
  sha256 "040ce34629870ca7f597b0b778d48c710bdda2b22ccd23e48e7c4c03bc54dd55"

  depends_on :arch => :x86_64

  def install
    mv "pivnet-darwin-amd64-#{version}", "pivnet"
    bin.install "pivnet"
  end

  test do
    system "#{bin}/pivnet"
  end
end
