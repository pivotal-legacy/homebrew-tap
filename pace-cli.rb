require 'formula'

class PaceCli < Formula
  homepage 'https://github.com/Pivotal-Field-Engineering/pace-builder'
  version "1.5"
  url "https://github.com/Pivotal-Field-Engineering/pace-builder/releases/download/v#{version}/pace-darwin"
  sha256 "906b79cb00fe1773f1f633695b760a64a88f781077d9ea918385bb6553d5ab3b"

  depends_on :arch => :x86_64

  def install
    mv "pace-darwin", "pace"
    bin.install "pace"
  end

  test do
    system "#{bin}/pace"
  end
end
