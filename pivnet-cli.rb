require 'formula'

class PivnetCli < Formula
  homepage 'https://github.com/pivotal-cf/pivnet-cli'
  version "0.0.58"
  url "https://github.com/pivotal-cf/pivnet-cli/releases/download/v#{version}/pivnet-darwin-amd64-#{version}"
  sha256 "ed89bceefd64677efdecca39053d29e15d32a4c9e3469bb159f1f2b436aa88ac"

  depends_on :arch => :x86_64

  def install
    mv "pivnet-darwin-amd64-#{version}", "pivnet"
    bin.install "pivnet"
  end

  test do
    system "#{bin}/pivnet"
  end
end
