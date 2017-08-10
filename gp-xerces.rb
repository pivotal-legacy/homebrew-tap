class GpXerces < Formula
  desc "GP-xerces supporting GPORCA"
  homepage "https://github.com/greenplum-db/gp-xerces/"
  url "https://github.com/greenplum-db/gp-xerces/archive/v3.1.2-p1.tar.gz"
  sha256 "ffc69798257a3e3885e0096e3eefd910a59f23731eb77dea92c87df210bc8227"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
