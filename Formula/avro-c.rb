class AvroC < Formula
  desc "Data serialization system"
  homepage "https://avro.apache.org/"
  url "https://www.apache.org/dyn/closer.cgi?path=avro/avro-1.9.1/c/avro-c-1.9.1.tar.gz"
  sha256 "7df7bc1e13ce7180f0438ed05ab6642b5b2b6df91f30b927b470e25a78e04642"

  bottle do
    cellar :any_skip_relocation
    sha256 "35aa07886a5188fc42edf2c4dd473857420f9e2ab8b981c4ebd08fabbbe32455" => :mojave
    sha256 "4ab18f360192adcd9900308820cb06b706d12b997a07b7f2fa6bf1366a91c477" => :high_sierra
    sha256 "0e24c43c6b2d1c356fdb135f0d94afaaf1274c922f7e58abf4c51581925da572" => :sierra
    sha256 "b97b62edfed9df2ba9bc1b9f931409dec2cf7815445d4d0087db3998ae85bf7b" => :x86_64_linux
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "jansson"
  depends_on "snappy"
  depends_on "xz"
  uses_from_macos "zlib"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
    pkgshare.install "tests/test_avro_1087"
  end

  test do
    assert shell_output("#{pkgshare}/test_avro_1087")
  end
end
