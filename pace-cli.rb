require 'formula'

class PaceCli < Formula
  homepage 'https://github.com/Pivotal-Field-Engineering/pace-builder'
  version "0.5"
  url "https://github.com/Pivotal-Field-Engineering/pace-builder/releases/download/v#{version}/pace-darwin"
  sha256 "9e01af572908b91c767607b89460efec040d2793e0c96e948dfff14314f48a2f"

  depends_on :arch => :x86_64

  def install
    mv "pace-darwin", "pace"
    bin.install "pace"
  end

  test do
    system "#{bin}/pace"
  end
end
