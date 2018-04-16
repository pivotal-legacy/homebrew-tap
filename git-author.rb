class GitAuthor < Formula
  homepage "https://github.com/pivotal/git-author"
  url "https://github.com/pivotal/git-author/archive/1.0.0.tar.gz"
  version "1.0.0"
  sha256 "68c88a12dd03f55d078fef2235bd0835f2378b08e625cc2998948fa44a202cd6"

  depends_on "git-together" => :install

  def install
    system "touch ~/.git-author-template"
    system "git config --global commit.template ~/.git-author-template"
    bin.install "git-author"
  end

  def caveats; <<~EOS
    export GIT_TOGETHER_NO_SIGNOFF=1 to ~/.bash_profile
    to disable --signoff added by git-together commit
    EOS
  end

  test do
    system "#{bin}/git-author"
  end
end
