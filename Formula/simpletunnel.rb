class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.64.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.0/simpletunnel-darwin-arm64"
      sha256 "2d1c8b27d6fc6958d2e73286374425cec9f02d07e45bd1b4c5baca0f88f52be9"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.0/simpletunnel-darwin-amd64"
      sha256 "7220b8e5e976b28feadd5f4e6e818aa88e4bfcf36323557720849a21a89b0911"
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
