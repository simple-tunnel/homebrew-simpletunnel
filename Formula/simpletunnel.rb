class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "1.6.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v1.6.45/simpletunnel-darwin-arm64"
      sha256 "c4b1d82fed48583c6c257e4a5793efd8bf4c2206c608749414a0a5c0c6710802"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v1.6.45/simpletunnel-darwin-amd64"
      sha256 "c4b1d82fed48583c6c257e4a5793efd8bf4c2206c608749414a0a5c0c6710802"
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
