class Yay < Formula
  desc "YAY command-line tool for parsing, formatting, and transcoding YAY documents"
  homepage "https://kriskowal.com/yay"
  version "1.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/kriskowal/yay/releases/download/v1.1.1/yay-aarch64-apple-darwin.tar.gz"
      sha256 "564b1ce11e26e8b12c9181e70d15f34dfe1280dcc43af04130a75ca3590db45d"
    end
    on_intel do
      url "https://github.com/kriskowal/yay/releases/download/v1.1.1/yay-x86_64-apple-darwin.tar.gz"
      sha256 "d72f9cc1f0e3e940b8aedb6df59620399a38cc6a9b63c294f1d95c51025abe69"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kriskowal/yay/releases/download/v1.1.1/yay-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "82d8dcede299ef78b47ad24ce43bb2a5c27fb6d309a839eaed76197f9839e8ec"
    end
    on_intel do
      url "https://github.com/kriskowal/yay/releases/download/v1.1.1/yay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e496a27327ae4533893dbe56c43e959058d1099142681331fdf14f2ea4d9f94d"
    end
  end

  def install
    bin.install "yay"
  end

  test do
    (testpath/"test.yay").write("key: 'value'\n")
    assert_match '"key": "value"', shell_output("#{bin}/yay -t json test.yay")
    system bin/"yay", "--check", "test.yay"
  end
end
