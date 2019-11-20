class GitTogether < Formula
  VERSION = "0.1.0-alpha.21"

  desc "Better commit attribution while pairing."
  homepage "https://github.com/kejadlen/git-together"
  version VERSION
  url "https://github.com/kejadlen/git-together/releases/download/v#{VERSION}/git-together-v#{VERSION}-x86_64-apple-darwin.tar.gz"
  sha256 "aeef14c94011af5c4acf7b07ef368fce098a15059d85a4a8f46a7f3525909973"

  depends_on "libssh2"
  depends_on "openssl@1.1"

  def install
    bin.install "git-together"
  end

  test do
    system "#{bin}/git-together"
  end
end
