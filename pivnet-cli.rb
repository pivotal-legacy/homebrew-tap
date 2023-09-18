require 'formula'

class PivnetCli < Formula
  homepage 'https://github.com/pivotal-cf/pivnet-cli'
  version "3.0.1"
  url "https://github.com/pivotal-cf/pivnet-cli/releases/download/v#{version}/pivnet-darwin-amd64-#{version}"
  sha256 "6eaadefe76eb96342b0ee8909625027b157e06d417e9a5ed8b413435c876351f"

  def install
    mv "pivnet-darwin-amd64-#{version}", "pivnet"
    bin.install "pivnet"
  end

  test do
    system "#{bin}/pivnet"
  end
end
