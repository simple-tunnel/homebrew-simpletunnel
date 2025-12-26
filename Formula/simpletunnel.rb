class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.17.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.8/simpletunnel-darwin-arm64"
      sha256 "284486fde246015b6f67b561e794706bef2bc1770bf3830ec22a53472da7d419"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.8/simpletunnel-darwin-amd64"
      sha256 "a59182505490049d76badc664caf375bfb10ee9b1c916ac755a1375342125c7d"
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
