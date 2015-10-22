require 'formula'

class BoshInit < Formula
  homepage 'https://github.com/cloudfoundry/bosh-init'
  url 'https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-0.0.77-darwin-amd64'
  version '0.0.77'
  sha1 '5ccca7d2d65e6c83abe97f5c00fe0c9f778c9408'

  depends_on :arch => :x86_64

  def install
    bin.install 'bosh-init-0.0.77-darwin-amd64' => 'bosh-init'
  end

  test do
    system "#{bin}/bosh-init"
  end
end
