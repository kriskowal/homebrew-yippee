class Yay < Formula
  desc "YAY command-line tool for parsing, formatting, and transcoding YAY documents"
  homepage "https://kriskowal.com/yay"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/kriskowal/yay/releases/download/v1.0.0/yay-aarch64-apple-darwin.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
    on_intel do
      url "https://github.com/kriskowal/yay/releases/download/v1.0.0/yay-x86_64-apple-darwin.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kriskowal/yay/releases/download/v1.0.0/yay-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
    on_intel do
      url "https://github.com/kriskowal/yay/releases/download/v1.0.0/yay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
