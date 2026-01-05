class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.34.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.34.5/simpletunnel-darwin-arm64"
      sha256 "fd86b775cb00f791a75effc57cc0b933c4c419489241598dfa22c5ffe280af0f"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.34.5/simpletunnel-darwin-amd64"
      sha256 "1aff2206ed9209d9b85d69561c904cab560a4f6111dd3c8fffca63cd715192ab"
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
