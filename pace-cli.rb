require 'formula'

class PaceCli < Formula
  homepage 'https://github.com/Pivotal-Field-Engineering/pace-builder'
  version "1.2"
  url "https://github.com/Pivotal-Field-Engineering/pace-builder/releases/download/v#{version}/pace-darwin"
  sha256 "fed9bced58d7e1aeb3d46f303066be3b3c2f7065e1915da611cd82c7b61eb5ff"

  depends_on :arch => :x86_64

  def install
    mv "pace-darwin", "pace"
    bin.install "pace"
  end

  test do
    system "#{bin}/pace"
  end
end
