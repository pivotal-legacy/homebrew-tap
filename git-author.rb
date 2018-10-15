class GitAuthor < Formula
  desc "The git-author to use git template to include multiple contributors"
  homepage "https://github.com/pivotal/git-author"
  url "https://github.com/pivotal/git-author/archive/v1.0.2.tar.gz"
  sha256 "40f75986f07a1904eadb7f3c5e9fca419f5e87e3928ed78b8df85567e5212f02"
  depends_on "git-together"

  def install
    bin.install "git-author"
    bin.install "setup.sh"
    system "#{bin}/setup.sh || true"
  end

  def caveats; <<-EOS
    export GIT_TOGETHER_NO_SIGNOFF=1 to ~/.bash_profile
    to disable --signoff added by git-together commit
  EOS
  end

  test do
    system "#{bin}/git-author"
  end
end
