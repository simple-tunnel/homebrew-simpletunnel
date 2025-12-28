class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.20.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.20.0/simpletunnel-darwin-arm64"
      sha256 "9d9b1f0343c31598882c1ff376d1decd2adf45da0d183f06006b81db8a316bcf"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.20.0/simpletunnel-darwin-amd64"
      sha256 "c0aa0bde7f33a9a41f003a1781f139f9b7265982a6df3269c57d462d3c3a2e07"
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
