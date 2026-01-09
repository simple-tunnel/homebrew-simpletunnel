class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.40.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.40.0/simpletunnel-darwin-arm64"
      sha256 "a12c2e1ea3d4c864ff2b51c75ecadab6ec2a909497263d2c0357d3d14539eaac"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.40.0/simpletunnel-darwin-amd64"
      sha256 "c0dca9a9d0f0013e7a7a96bd86143053cdb91183903d285f067fa4720ac7a818"
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
