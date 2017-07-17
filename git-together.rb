class GitTogether < Formula
  desc "Better commit attribution while pairing."
  homepage "https://github.com/kejadlen/git-together/tree/v0.1.0-alpha.11"
  version "0.1.0-alpha.11"
  url "https://github.com/kejadlen/git-together/releases/download/v#{version}/git-together-v#{version}-x86_64-apple-darwin.tar.gz"
  sha256 "00a6fd23d380046e3ebe8f16bd3afc78b996240266a1c692e38f82d63fc98ea9"

  def install
    bin.install "git-together"
  end

  test do
    system "#{bin}/git-together"
  end
end
