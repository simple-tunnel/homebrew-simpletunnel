class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.78.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.78.2/simpletunnel-darwin-arm64"
      sha256 "3f715f05ba272a051d1971fb3d426dad3b5d40a7d3652fc619ebb01b53cadf8e"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.78.2/simpletunnel-darwin-amd64"
      sha256 "166e9e4f2e91adb0ab12531914039d60a31742643694710007c690d96f74e547"
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
