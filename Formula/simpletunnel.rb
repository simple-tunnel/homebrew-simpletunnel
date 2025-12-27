class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.18.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.2/simpletunnel-darwin-arm64"
      sha256 "a3cf8261547dcdba477940977ad8c30c9b405dc6ac0f50d2233db4c413f19bf7"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.2/simpletunnel-darwin-amd64"
      sha256 "0fda1b4ac910f5abba8f1a814acb782ed13b0148733b2d93b20364eab25edf87"
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
