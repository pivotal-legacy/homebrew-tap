class GitTogether < Formula
  VERSION = "0.1.0-alpha.17"

  desc "Better commit attribution while pairing."
  homepage "https://github.com/kejadlen/git-together"
  version VERSION
  url "https://github.com/kejadlen/git-together/releases/download/v#{VERSION}/git-together-v#{VERSION}-x86_64-apple-darwin.tar.gz"
  sha256 "663317392f662712c1a7a2299fc60d2fdae2c6a81f9ead5f490b574c69d27346"

  depends_on "libssh2"
  depends_on "openssl@1.1"

  def install
    bin.install "git-together"
  end

  test do
    system "#{bin}/git-together"
  end
end
