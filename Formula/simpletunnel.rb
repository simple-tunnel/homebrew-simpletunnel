class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.34.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.34.0/simpletunnel-darwin-arm64"
      sha256 "584c6b7fc66fcccd54761b275e52b9921f92fcf9e7a0cf7ad8eee03d092c4b00"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.34.0/simpletunnel-darwin-amd64"
      sha256 "57d301709c1c6c670440b3fb26d125a22ad1fa330b934960a2d462a654d659cb"
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
