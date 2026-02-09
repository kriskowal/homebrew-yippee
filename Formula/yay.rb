class Yay < Formula
  desc "YAY command-line tool for parsing, formatting, and transcoding YAY documents"
  homepage "https://kriskowal.com/yay"
  version "1.0.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/kriskowal/yay/releases/download/v1.0.1/yay-aarch64-apple-darwin.tar.gz"
      sha256 "3636d8b7c02e17dcf34aea16578bc68dbe4f12d68a5cc37e8f07995a20dd57f1"
    end
    on_intel do
      url "https://github.com/kriskowal/yay/releases/download/v1.0.1/yay-x86_64-apple-darwin.tar.gz"
      sha256 "eba298186a605c3290894fbf528caa70a7d0f7caa7856f192cea3b1dd94d8207"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kriskowal/yay/releases/download/v1.0.1/yay-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7018d3a10f54a0c82b9f4dde6e8bcc77f3e2b2de24e0d11d80818c07e3988e48"
    end
    on_intel do
      url "https://github.com/kriskowal/yay/releases/download/v1.0.1/yay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a5e60faf9256224533afe93df2f3dab96e26a59d83d9d111177ee29de919434"
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
