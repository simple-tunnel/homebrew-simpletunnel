class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.21.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.21.1/simpletunnel-darwin-arm64"
      sha256 "7f66c24e023ba4c8787f3b76e25a9eeb85d7c7f06327226a4e7ac7fb0d47709b"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.21.1/simpletunnel-darwin-amd64"
      sha256 "5f8367215af453b0f2c3bfffb5d88f305393a0aef8cb1f7856b72209a314ef82"
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
