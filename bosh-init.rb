require 'formula'

class BoshInit < Formula
  homepage 'https://github.com/cloudfoundry/bosh-init'
  url 'https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-0.0.29-darwin-amd64'
  version '0.0.29'
  sha1 '524833c21d8cfa4dcd9d0e4d7ececdad8b474d71'

  depends_on :arch => :x86_64

  def install
    bin.install 'bosh-init-0.0.29-darwin-amd64' => 'bosh-init'
  end

  test do
    system "#{bin}/bosh-init"
  end
end
