class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.22.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.1/simpletunnel-darwin-arm64"
      sha256 "cf820331af9ad6e370e6cd094811ddfd263de2457d8a8ac0b97318602a71e48b"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.1/simpletunnel-darwin-amd64"
      sha256 "aa51be34206f76b1fdf097ac9cf57486bee58e89c21b75e72f52c15fa7646d49"
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
