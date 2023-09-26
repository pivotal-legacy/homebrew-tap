#
# This file has been automatically generated. Any changes will be overwritten.
#
require 'formula'

class PivnetCli < Formula
  homepage 'https://github.com/pivotal-cf/pivnet-cli'
  version "4.1.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/pivotal-cf/pivnet-cli/releases/download/v#{version}/pivnet-darwin-arm64-4.1.1"
      sha256 "5c486dbec1166e7da7b9480c8c83fc1e4213ffe8468ad41e89ebd4f47018fd71"
    else
      url "https://github.com/pivotal-cf/pivnet-cli/releases/download/v#{version}/pivnet-darwin-amd64-4.1.1"
      sha256 "227a8e28706e454a8c16e77dccb9880abd62134a5f5d688de31017ae1997b7f2"
    end
  elsif OS.linux?
    url "https://github.com/pivotal-cf/pivnet-cli/releases/download/v#{version}/pivnet-linux-amd64-4.1.1"
    sha256 "5462367e67836cda6ecf3fb87b72d22947dcb385aeb217bf896bcc05b99559eb"
  end

  def install
    # mv "pivnet-darwin-amd64-#{version}", "pivnet"
    # bin.install "pivnet"
    binary_name = "pivnet"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "pivnet-darwin-arm64-4.1.1" => binary_name
      else
        bin.install "pivnet-darwin-amd64-4.1.1" => binary_name
      end
    elsif OS.linux?
      bin.install "pivnet-linux-amd64-4.1.1" => binary_name
    end
  end

  test do
    system "#{bin}/pivnet"
  end
end
