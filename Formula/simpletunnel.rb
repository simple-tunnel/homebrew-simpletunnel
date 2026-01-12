class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.53.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.53.1/simpletunnel-darwin-arm64"
      sha256 "5415ef9efc2f9711c73c43b0159a33685f66e925199d08292bfc3b042f1efa1a"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.53.1/simpletunnel-darwin-amd64"
      sha256 "40dc2fa01885b66bd3684a87d0d22c46a941c75ce26806d94026a44db82af9c9"
    end
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  def caveats
    <<~EOS
      SimpleTunnel requires an API key to function.

      1. Get your API key from https://simpletunnel.com
      2. Use SimpleTunnel:
         simpletunnel -port 3000 -key YOUR_API_KEY

      For more information, visit https://simpletunnel.com/docs
    EOS
  end

  test do
    assert_match "SimpleTunnel", shell_output("#{bin}/simpletunnel -h 2>&1", 1)
  end
end
