class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.50.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.50.0/simpletunnel-darwin-arm64"
      sha256 "5baf0da3bbe475e2569766803a01ff2d148a8e71e7ddf4b0c63e776844cb2fbb"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.50.0/simpletunnel-darwin-amd64"
      sha256 "b9eb8d005b0d2853c6ab0c8e70883164ec59d6d0d592f6969c47e923fcc3aa6e"
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
