class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.2.56"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.2.56/simpletunnel-darwin-arm64"
      sha256 "ff8eefd8ad232cbf51f0e38ac3cb79d9e942b9e9024ed46c6ea4aa9edd04499e"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.2.56/simpletunnel-darwin-amd64"
      sha256 "d522e07c701fb7713b139ebdfcb82a55572090fd01a76ddacef0edfa3ec53232"
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
