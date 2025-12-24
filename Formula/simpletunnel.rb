class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.14.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.14.1/simpletunnel-darwin-arm64"
      sha256 "371d26a65f42847fac5b54c4118aedd260a399f552c78a417790423d903de3a1"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.14.1/simpletunnel-darwin-amd64"
      sha256 "98a156cb28aba74ea527177226e56f5fb8733606e4448634a48412bb143c2748"
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
