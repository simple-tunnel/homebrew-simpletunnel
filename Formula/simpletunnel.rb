class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.55.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.55.0/simpletunnel-darwin-arm64"
      sha256 "7b0f08f8a7c42cd399a19ebd02b4628deac59de5c3d232c9ade677097b0eaed9"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.55.0/simpletunnel-darwin-amd64"
      sha256 "e4aa0c941d2a67268381f0bb9d7e494567a75582f03f3a21c85986facac87e79"
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
