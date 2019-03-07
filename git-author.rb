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
    export GIT_TOGETHER_NO_SIGNOFF=1 to ~/.bash_profile
    to disable --signoff added by git-together commit

    Please note the setup is incomplete, you must follow instructions in
    "https://github.com/pivotal/git-author".
  EOS
  end

  test do
    system "#{bin}/git-author"
  end
end
