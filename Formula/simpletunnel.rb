class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.66.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.66.1/simpletunnel-darwin-arm64"
      sha256 "25c4c99f5692bb3a21bea63a29f23977abbf11e8550cd01217d956f7d26afe3d"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.66.1/simpletunnel-darwin-amd64"
      sha256 "6b9173b7176e4ae2d62d7337dc7d5796d1dcf39c82419278a996d86612c6803c"
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
