class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.31.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.31.0/simpletunnel-darwin-arm64"
      sha256 "49925cf8f9ba61cc38f29082e09c6a167b3e3629fa2ad7a29833e1bece17bf66"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.31.0/simpletunnel-darwin-amd64"
      sha256 "3c05ee48b7bced569db73c2e3b617e6c86fa8ab66294386f0257b4854a74a776"
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
