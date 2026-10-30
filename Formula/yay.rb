class Yay < Formula
  desc "YAY command-line tool for parsing, formatting, and transcoding YAY documents"
  homepage "https://kriskowal.com/yay"
  version "2.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/kriskowal/yay/releases/download/v2.0.0/yay-aarch64-apple-darwin.tar.gz"
      sha256 "dab72c3c07663eb8c74c1eb63289e1a110f09ee0dcdbbdd97340984c65a8d5d7"
    end
    on_intel do
      url "https://github.com/kriskowal/yay/releases/download/v2.0.0/yay-x86_64-apple-darwin.tar.gz"
      sha256 "88e021cd4b7661596dabbfe82fee35b6d797465b6bdfc0b455db033ef3cd1c76"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kriskowal/yay/releases/download/v2.0.0/yay-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5524108142557635e846f7e1cb710d8d4857eff04ab718bc2d844ae49145bb13"
    end
    on_intel do
      url "https://github.com/kriskowal/yay/releases/download/v2.0.0/yay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b39c7b55b4aaed06a000ef6d581c986d922ffbc144b2cb31fbaed139b3ae75c9"
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
