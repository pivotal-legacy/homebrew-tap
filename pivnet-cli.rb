require 'formula'

class PivnetCli < Formula
  homepage 'https://github.com/pivotal-cf/go-pivnet'
  version "0.0.24"
  url "https://github.com/pivotal-cf/go-pivnet/releases/download/v#{version}/pivnet-darwin-amd64-#{version}"
  sha256 "9cf53209d97c29547c947f1476b115f704733431196750b5ea0fab18465a5f95"

  depends_on :arch => :x86_64

  def install
    mv "pivnet-darwin-amd64-#{version}", "pivnet"
    bin.install "pivnet"
  end

  test do
    system "#{bin}/pivnet"
  end
end
