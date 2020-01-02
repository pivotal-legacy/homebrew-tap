class GitAuthor < Formula
  desc "The git-author to use git template to include multiple contributors"
  homepage "https://github.com/pivotal/git-author"
  url "https://github.com/pivotal/git-author/archive/v1.1.0.tar.gz"
  sha256 "603bfd9376b2ce7555dd5b29770c07d5ca73a06fc607f1ee842c371dc9357b9d"
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
