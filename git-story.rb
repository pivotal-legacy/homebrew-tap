class GitStory < Formula
  desc "Manage your code branches with story information from Pivotal Tracker"
  homepage "https://github.com/git-story-branch/git-story-branch"
  version "0.0.1"
  url "https://github.com/git-story-branch/git-story-branch/releases/download/v#{version}/git-story-darwin-x64.tar.gz"
  sha256 "62a1e09a3fb7f24f4c633b2448902dc79cb4a78f0b06d35aa12878bf28c2df14"
  license "MIT"

  bottle :unneeded

  def install
    bin.install "git-story-view"
  end

  test do
    system "which #{bin}/git-story-view"
  end
end
