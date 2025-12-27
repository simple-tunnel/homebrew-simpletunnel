class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.18.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.8/simpletunnel-darwin-arm64"
      sha256 "ab023caa077579dd973ada0fe7ce3dd82cbef232e44cf1c51420cfb4522df829"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.8/simpletunnel-darwin-amd64"
      sha256 "cef08a4a2f6e6ef0bf936bc76666d400d18dd65230ef9a98e6deac7ac5095b41"
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
