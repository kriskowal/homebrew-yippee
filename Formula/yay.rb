class Yay < Formula
  desc "YAY command-line tool for parsing, formatting, and transcoding YAY documents"
  homepage "https://kriskowal.com/yay"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/kriskowal/yay/releases/download/v1.1.0/yay-aarch64-apple-darwin.tar.gz"
      sha256 "bbba7bf753e45d2500ca27cfd858ca335280e3d98568a24654bc9cb1493239c7"
    end
    on_intel do
      url "https://github.com/kriskowal/yay/releases/download/v1.1.0/yay-x86_64-apple-darwin.tar.gz"
      sha256 "c430a3046c5fdcce31571ec3edd387384109ea362f9a3f98626e3c5e7fe0db84"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kriskowal/yay/releases/download/v1.1.0/yay-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0601a214ad6fda11841dd361b85e7b03a4ea762380733a47b436ce8e0d5ed20c"
    end
    on_intel do
      url "https://github.com/kriskowal/yay/releases/download/v1.1.0/yay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7b674d01aa640aaf72240e5b83a81219d2d8137b6b0fb84983793f5f9801a7d5"
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
