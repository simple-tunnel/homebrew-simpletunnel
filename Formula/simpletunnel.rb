class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.53.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.53.0/simpletunnel-darwin-arm64"
      sha256 "b32c2cd3c9af64ff63c5f9713da1b8fc5fa1de667c89c5958cff3925f12013d4"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.53.0/simpletunnel-darwin-amd64"
      sha256 "d94087a6419131ed27705ef42d75b81b3a2175220f7efa876912ed12df712c9c"
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
