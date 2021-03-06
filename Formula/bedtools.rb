class Bedtools < Formula
  desc "Tools for genome arithmetic (set theory on the genome)"
  homepage "https://github.com/arq5x/bedtools2"
  url "https://github.com/arq5x/bedtools2/archive/v2.29.0.tar.gz"
  sha256 "8a13b7ec93a2dc960616268d8009f6061bec5a32b8a38d5734f80e851bb8ed1e"

  bottle do
    cellar :any_skip_relocation
    sha256 "3e30f5e4d1ef7184dec191d9c5ecf3d2575a8fd63195819f49207f37aa6c6c78" => :mojave
    sha256 "7f95922a3ce9210eb0ad5fee569032f5ce10147b97eef07061d193322e9d6ac7" => :high_sierra
    sha256 "281b63ca90868adecb3cdc2c1cf5e56761ad7e63aced8c35012320c9389b42c2" => :sierra
    sha256 "8ac0c3d15cc186da2efe38489dd32162aabb4938d6c32d7d8bf1d1715ec9cac6" => :x86_64_linux
  end

  depends_on "xz"
  unless OS.mac?
    depends_on "python@2" => :build
    depends_on "bzip2"
    depends_on "zlib"
  end

  def install
    system "make"
    system "make", "install", "prefix=#{prefix}"
  end

  test do
    (testpath/"t.bed").write "c\t1\t5\nc\t4\t9"
    assert_equal "c\t1\t9", shell_output("#{bin}/bedtools merge -i t.bed").chomp
  end
end
