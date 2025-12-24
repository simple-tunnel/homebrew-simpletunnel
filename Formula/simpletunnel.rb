class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.6.3/simpletunnel-darwin-arm64"
      sha256 "e10c080f252641bc8e5d96b2dc1cb441944ba42871684109e7d3f74a2c298cff"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.6.3/simpletunnel-darwin-amd64"
      sha256 "2509683ab1e363e11a0936e1f7dd503df6a2fe50ab281abc8d539421e2993c17"
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
