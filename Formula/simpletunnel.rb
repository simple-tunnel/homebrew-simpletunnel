class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.62.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.62.1/simpletunnel-darwin-arm64"
      sha256 "5aee29aa2e38f7a8520d67df01d978537f87eaa5c753f9d2d59dc3bf6e0cc612"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.62.1/simpletunnel-darwin-amd64"
      sha256 "d92949da66376f356870082124458ba4c6863f3fe317755f4415d046ab1b0e0c"
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
