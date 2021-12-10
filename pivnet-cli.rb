require 'formula'

class PivnetCli < Formula
  class << self
    def product_filename
      if OS.mac?
        "pivnet-darwin-amd64-#{version}"
      else
        "pivnet-linux-amd64-#{version}"
      end
    end
    
    def product_sha
      if OS.mac?
        "6eaadefe76eb96342b0ee8909625027b157e06d417e9a5ed8b413435c876351f"
      else
        "7ade3877a7e973227c58cac6ae3a51ad788130387c166463691fe08f377928fc"
      end
    end
  end
  
  homepage 'https://github.com/pivotal-cf/pivnet-cli'
  version "3.0.1"
  url "https://github.com/pivotal-cf/pivnet-cli/releases/download/v#{version}/#{product_filename}"
  sha256 product_sha 

  depends_on :arch => :x86_64

  def install
    mv self.class.product_filename, "pivnet"
    bin.install "pivnet"
  end

  test do
    system "#{bin}/pivnet"
  end
end
