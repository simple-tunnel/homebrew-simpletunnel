class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.25.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.8/simpletunnel-darwin-arm64"
      sha256 "9e336c409dbb632ff45bba9e9a294c8763451e6f0986200985025981f5e9efd9"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.8/simpletunnel-darwin-amd64"
      sha256 "792e0599044602fc9586df73f21240c1d8a82a28842dc49dd9ff2099eeb02909"
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
