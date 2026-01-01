class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.15.0/simpletunnel-darwin-arm64"
      sha256 "115e5a1834305111eadce80f7e9152fb4ccc0a2f09043f75efd29c952a6e99a8"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.15.0/simpletunnel-darwin-amd64"
      sha256 "e4de9ea31d208199a2d9a6518eea115b6106b6e1d6ef813de8e78d818e52d9a7"
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
