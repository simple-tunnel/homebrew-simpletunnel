class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "1.6.53"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v1.6.53/simpletunnel-darwin-arm64"
      sha256 "2bb1fb0b2bb21c6b73d892f1b52e703b1ff08b0c74f2c2b0978fa6ce1044f531"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v1.6.53/simpletunnel-darwin-amd64"
      sha256 "2bb1fb0b2bb21c6b73d892f1b52e703b1ff08b0c74f2c2b0978fa6ce1044f531"
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
