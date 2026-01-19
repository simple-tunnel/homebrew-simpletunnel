class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.74.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.74.1/simpletunnel-darwin-arm64"
      sha256 "ccf15a8e1f78b147806f5b104afd79219522472ee50a4cc03e50bd1375445007"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.74.1/simpletunnel-darwin-amd64"
      sha256 "6fb29cdd15033529173b1c0fc14ef4437dfe047d99cb9d90a4cb70adc02fd697"
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
