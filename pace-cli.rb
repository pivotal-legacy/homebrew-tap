require 'formula'

class PaceCli < Formula
  homepage 'https://github.com/Pivotal-Field-Engineering/pace-builder'
  version "0.9"
  url "https://github.com/Pivotal-Field-Engineering/pace-builder/releases/download/v#{version}/pace-darwin"
  sha256 "18ad02547684800d6d8e236c7b95fdba2f1810a9759b45970d637e039da245a3"

  depends_on :arch => :x86_64

  def install
    mv "pace-darwin", "pace"
    bin.install "pace"
  end

  test do
    system "#{bin}/pace"
  end
end
