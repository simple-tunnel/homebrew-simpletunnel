class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.6.1/simpletunnel-darwin-arm64"
      sha256 "0e5259364d2c58d0d54f2c5527072ce08d08572988957dbbb8fc61729de2fa06"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.6.1/simpletunnel-darwin-amd64"
      sha256 "1bae216e08e04b6e40b32bc745fcd2f8ef33c41a25cf0086b9a5476830804878"
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
