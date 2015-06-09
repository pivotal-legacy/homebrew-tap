require 'formula'

class BoshInit < Formula
  homepage 'https://github.com/cloudfoundry/bosh-init'
  url 'https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-0.0.53-darwin-amd64'
  version '0.0.53'
  sha1 'e05fdeeb1e8e467eb7ad2fc5b88c470c75e78371'

  depends_on :arch => :x86_64

  def install
    bin.install 'bosh-init-0.0.53-darwin-amd64' => 'bosh-init'
  end

  test do
    system "#{bin}/bosh-init"
  end
end
