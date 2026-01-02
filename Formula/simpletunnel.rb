class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.25.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.9/simpletunnel-darwin-arm64"
      sha256 "dcbb88e4186f73c60d644c2311bf76c4fbe595f9f05ac2e8972eccdb0ac7008e"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.9/simpletunnel-darwin-amd64"
      sha256 "f1798fdd95d025f745df1cf3c02a88dd5817de4c9d53938cb07db368e9fee251"
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
