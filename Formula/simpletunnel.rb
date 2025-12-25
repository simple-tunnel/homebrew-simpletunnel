class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.15.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.6/simpletunnel-darwin-arm64"
      sha256 "15b2ef3a38260cfab62cc926289f7640eadd8f9e4e36a8c763c12dff7f10c3a6"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.6/simpletunnel-darwin-amd64"
      sha256 "7cfeff2fc013deadbe2216f75064576ff64419805f55deb0d9df060b5d3d7389"
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
