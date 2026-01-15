class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.56.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.56.0/simpletunnel-darwin-arm64"
      sha256 "ad03d940061ecc622410893f3e66208575419dd88c2c3199d6c1359072e131b5"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.56.0/simpletunnel-darwin-amd64"
      sha256 "4b9512493bc4dbfe78f1b6950c2da0cf27bc2a8885ccc198aaac3ab3dd95e348"
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
