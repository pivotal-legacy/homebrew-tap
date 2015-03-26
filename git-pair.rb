class GitPair < Formula
  homepage "https://github.com/pivotal/git_scripts"
  url "https://github.com/pivotal/git_scripts/archive/v1.4.0.tar.gz"
  version "1.4.0"
  sha256 "eb97bc46e8048c0030baa39396920895b4ac0f0941415068e9658bb763dfee9d"

  def install
    inreplace "bin/git-pair", "File.dirname(__FILE__)", "'#{prefix}/lib'"

    prefix.install "lib"
    bin.install "bin/git-pair"
  end
end
