class GitAuthor < Formula
  desc "The git-author to use git template to include multiple contributors"
  homepage "https://github.com/pivotal/git-author"
  url "https://github.com/pivotal/git-author/archive/v1.0.3.tar.gz"
  sha256 "a46797939b9763fef061c5e87305f3360e33ae455508f3448d2ea6753c3da824"
  depends_on "git-together"

  def install
    bin.install "git-author"
    bin.install "setup.sh"
    system "#{bin}/setup.sh || true"
  end

  def caveats; <<-EOS
    Please follow https://github.com/pivotal/git-author#setup for further setup instructions.
  EOS
  end

  test do
    system "#{bin}/git-author"
  end
end
