require 'formula'

class BoshInit < Formula
  homepage 'https://github.com/cloudfoundry/bosh-init'
  url 'https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-0.0.81-darwin-amd64'
  version '0.0.81'
  sha1 'd78e520f805d1d07767904b1a566a418e5c16628'

  depends_on :arch => :x86_64

  def install
    bin.install 'bosh-init-0.0.81-darwin-amd64' => 'bosh-init'
  end

  test do
    system "#{bin}/bosh-init"
  end
end
