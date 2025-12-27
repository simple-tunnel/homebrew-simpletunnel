class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.18.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.1/simpletunnel-darwin-arm64"
      sha256 "f177971787005b56cefea34c01c47c99b75281116f589a1817ba1d9f0792d5ea"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.1/simpletunnel-darwin-amd64"
      sha256 "3a7505ba5e56300eb60d8b36976242702493d8cf5f35e6fe6753df9c7be2576c"
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
