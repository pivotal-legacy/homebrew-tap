require 'formula'

class PaceCli < Formula
  homepage 'https://github.com/Pivotal-Field-Engineering/pace-builder'
  version "0.4"
  url "https://github.com/Pivotal-Field-Engineering/pace-builder/releases/download/v#{version}/pace-darwin"
  sha256 "4c2072c7c9fa42dbfee9b6016f411cc905d9852aa82499fc3a6d4643437efe83"

  depends_on :arch => :x86_64

  def install
    mv "pace-darwin", "pace"
    bin.install "pace"
  end

  test do
    system "#{bin}/pace"
  end
end
