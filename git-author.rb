class GitAuthor < Formula
  desc "The git-author to use git template to include multiple contributors"
  homepage "https://github.com/vmware-archive/git-author"
  url "https://github.com/vmware-archive/git-author/archive/v1.1.0.tar.gz"
  sha256 "603bfd9376b2ce7555dd5b29770c07d5ca73a06fc607f1ee842c371dc9357b9d"
  depends_on "git-together"

  deprecate! date: "2023-01-18", because: :repo_archived

  def install
    bin.install "git-author"
    bin.install "setup.sh"
    system "#{bin}/setup.sh || true"
  end

  def caveats
    "Please follow https://github.com/vmware-archive/git-author#setup for further setup instructions."
  end

  test do
    system "#{bin}/git-author"
  end
end
