class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.60.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.60.1/simpletunnel-darwin-arm64"
      sha256 "b4a0db70c53674299ead7672281a91c7300ff192e4482f77f05e0306af0d560e"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.60.1/simpletunnel-darwin-amd64"
      sha256 "a0bf8743dfd67679e11f89de1d79447d4363d175d883d0f92e7301de0b01ab21"
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
