class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.78.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.78.1/simpletunnel-darwin-arm64"
      sha256 "bed50c621cd8e410ee579f9dfb29bd328fd5df590cfbce1f1e74cd9c4690f2e9"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.78.1/simpletunnel-darwin-amd64"
      sha256 "0f4d7be63218d2098c7959ae37337addbc1710d3797de7ec5f87edeb837516a5"
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
