class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.13.0/simpletunnel-darwin-arm64"
      sha256 "688d9c2468d214ac9f3c8b5a3a2089bb8a5bc2da56e5f3a6969d7526c730889a"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.13.0/simpletunnel-darwin-amd64"
      sha256 "ca408f83bf355d8ae3563abd0d181640e524896ed47346f57e287bdcfd45acba"
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
