class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.1.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.1.12/simpletunnel-darwin-arm64"
      sha256 "a5e4f2e3f1d27085480f74e7d88fb12a22b05cf1aa5176b8840ef178c0b7cfee"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.1.12/simpletunnel-darwin-amd64"
      sha256 "3522700ad5c5c64a415ba4b58e1cfe5bc79a764bd565d83d770f6a3a6e6b5d6c"
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
