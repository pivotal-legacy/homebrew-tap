class GitTogether < Formula
  VERSION = "0.1.0-alpha.13"

  desc "Better commit attribution while pairing."
  homepage "https://github.com/kejadlen/git-together"
  version VERSION
  url "https://github.com/kejadlen/git-together/releases/download/v#{VERSION}/git-together-v#{VERSION}-x86_64-apple-darwin.tar.gz"
  sha256 "072ad72d40c6771d172b12c6e5cb47fcc4190ea5b72faa99025774c675b15a13"

  depends_on "libssh2"

  def install
    bin.install "git-together"
  end

  test do
    system "#{bin}/git-together"
  end
end
