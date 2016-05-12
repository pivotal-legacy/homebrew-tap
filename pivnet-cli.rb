require 'formula'

class PivnetCli < Formula
  homepage 'https://github.com/pivotal-cf-experimental/go-pivnet'
  version "0.0.13"
  url "https://github.com/pivotal-cf-experimental/go-pivnet/releases/download/v#{version}/pivnet-darwin-amd64-#{version}"
  sha256 "58148a5aa1510f0c6a632bd9fd4fd09ce9c4803da304f35b677205dd884995eb"

  depends_on :arch => :x86_64

  def install
    mv "pivnet-darwin-amd64-#{version}", "pivnet"
    bin.install "pivnet"
  end

  test do
    system "#{bin}/pivnet"
  end
end
