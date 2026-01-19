class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.79.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.79.1/simpletunnel-darwin-arm64"
      sha256 "bca8699d27a8a36c0ad04429c633967214c115560ec634fb1fddee481771d895"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.79.1/simpletunnel-darwin-amd64"
      sha256 "f9cfd05c860019e8ca8eb21d853e91a6ab4ec608f576a9380adc1be84266017e"
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
