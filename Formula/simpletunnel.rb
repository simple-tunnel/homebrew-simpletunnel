class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.64.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.10/simpletunnel-darwin-arm64"
      sha256 "ff98d029ad7c27979f873c0f13a10bbec28d7be12da74441a1c5f33f5699219c"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.10/simpletunnel-darwin-amd64"
      sha256 "c99b412334bad3a18d50251f9c08a916394b15bf4e5d7d4c15fdf77bccd0f44b"
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
