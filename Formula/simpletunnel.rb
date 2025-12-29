class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.21.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.21.8/simpletunnel-darwin-arm64"
      sha256 "8bf50bdfdb2f55fb623b162d038bf9779a597b703a2b03fb02ba63068180adf7"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.21.8/simpletunnel-darwin-amd64"
      sha256 "dcd8d1f7b822f4d1aeda348df5b1eec17e0b7231d3d1db4811cf13fa6776a01f"
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
