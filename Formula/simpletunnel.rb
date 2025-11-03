class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.3.0/simpletunnel-darwin-arm64"
      sha256 "7e4eafe485e19289a4253cfb1adae52cfc1a4b8466f68681e1f515de76641449"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.3.0/simpletunnel-darwin-amd64"
      sha256 "88fae4639326b762a84d6d63f4d25e767982c2f54b1268a5a200229366d64681"
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
