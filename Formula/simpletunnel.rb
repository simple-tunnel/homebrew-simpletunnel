class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.34.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.34.1/simpletunnel-darwin-arm64"
      sha256 "2e0325668b286199a1f0365db3fc338e16deb405d29491e72cf85851283ee9d6"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.34.1/simpletunnel-darwin-amd64"
      sha256 "0a79caf07ec6bda73fbbcd79aeb105806176f2315c971101a5201fa18edce5c2"
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
