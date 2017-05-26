class Allmark < Formula
  desc "Cross-platform markdown web server"
  homepage "https://allmark.io"
  url "https://github.com/andreaskoch/allmark/releases/download/v0.10.0/allmark_darwin_amd64"
  sha256 "1b0ad9341f4d125a4143ecdac50a61dd7be137f587ea496895fbbe2891d6d43a"

  def install
    mv "allmark_darwin_amd64", "allmark"
    bin.install "allmark"
  end

  test do
    "allmark --help"
  end
end
