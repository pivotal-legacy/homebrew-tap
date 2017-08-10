class Gporca < Formula
  desc "A modular query optimizer for big data"
  homepage "https://github.com/greenplum-db/gporca"
  url "https://github.com/greenplum-db/gporca/archive/v2.39.2.tar.gz"
  sha256 "86c98abdcf61d1576469ac458a5f3bc0ecf66c1608e02024fd06e2aaed6b01be"

  depends_on "ccache" => :build # orca build
  depends_on "cmake" => :build # orca build
  depends_on "ninja" => :build # orca build

  depends_on "gp-xerces" => :build # with greenplum-db patch in xml handling

  def install
    system "cmake -DCMAKE_INSTALL_PREFIX=#{prefix}"
    system "make"
    system "make", "install"
  end
end
