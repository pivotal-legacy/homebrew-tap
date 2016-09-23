require 'formula'

class PivnetCli < Formula
  homepage 'https://github.com/pivotal-cf/go-pivnet'
  version "0.0.23"
  url "https://github.com/pivotal-cf/go-pivnet/releases/download/v#{version}/pivnet-darwin-amd64-#{version}"
  sha256 "98ef598c6571a005beaafdb6abfdb0ed4dbb278ea23da21e4d22b6909e609948"

  depends_on :arch => :x86_64

  def install
    mv "pivnet-darwin-amd64-#{version}", "pivnet"
    bin.install "pivnet"
  end

  test do
    system "#{bin}/pivnet"
  end
end
