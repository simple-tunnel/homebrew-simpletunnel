class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.5.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.5.5/simpletunnel-darwin-arm64"
      sha256 "07ce36187926e4d0933dad95442f7dc3e58b68563853e067833ae4a0d618d4a1"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.5.5/simpletunnel-darwin-amd64"
      sha256 "c3e40b69360059d75d0f60d89e37f87681cd4c9b73556ac711a0a24b958041bf"
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
