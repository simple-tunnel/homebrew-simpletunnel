class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.5.0/simpletunnel-darwin-arm64"
      sha256 "685a7201ae77f2b92f543d37a2ad47330b990a3f0e8f247f5cabb3e780c65920"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.5.0/simpletunnel-darwin-amd64"
      sha256 "0dc62fc4d9d10e9d762c6ce9ee55d9bb7deee8902e1b3702029fcffa99857662"
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
