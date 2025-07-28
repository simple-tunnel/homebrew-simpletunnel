class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "1.19.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v1.19.18/simpletunnel-darwin-arm64"
      sha256 "84700b7fc3ddadf15d6e19f7dd28f2ae5c1621a9f4dd053a7a2cd4ec62b51f7e"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v1.19.18/simpletunnel-darwin-amd64"
      sha256 "84700b7fc3ddadf15d6e19f7dd28f2ae5c1621a9f4dd053a7a2cd4ec62b51f7e"
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
