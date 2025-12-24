class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.9.0/simpletunnel-darwin-arm64"
      sha256 "f7a64b8527219a0f65a1658b346c812918eca8d3dca2a08c471a1bf173366ffd"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.9.0/simpletunnel-darwin-amd64"
      sha256 "223a89f44195d3c43475e7000d5e86c77b1512d64aaf3059785e5c78d6264632"
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
