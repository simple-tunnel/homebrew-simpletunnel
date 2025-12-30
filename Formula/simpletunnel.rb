class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.3.0/simpletunnel-darwin-arm64"
      sha256 "a566d1afcf20f51c31b6ba40908cb5032a1a10ff7e0436a609cb91dee0412e26"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.3.0/simpletunnel-darwin-amd64"
      sha256 "3debefa0bc3ab648e57ee22f8d2734c7e3fad53791cd7b5fe3fa3bd82f3e88fb"
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
