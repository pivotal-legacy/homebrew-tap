require 'formula'

class PivnetCli < Formula
  homepage 'https://github.com/pivotal-cf/pivnet-cli'
  version "0.0.60"
  url "https://github.com/pivotal-cf/pivnet-cli/releases/download/v#{version}/pivnet-darwin-amd64-#{version}"
  sha256 "b8ef4b5f2afb1da2185e95d856aad4ba9ce05942089272a7a81c3436f3ed4a3e"

  depends_on :arch => :x86_64

  def install
    mv "pivnet-darwin-amd64-#{version}", "pivnet"
    bin.install "pivnet"
  end

  test do
    system "#{bin}/pivnet"
  end
end
