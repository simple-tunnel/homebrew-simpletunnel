class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.42.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.42.0/simpletunnel-darwin-arm64"
      sha256 "4adadb43126182ca2d55789ed2d027d97b8d5a68724a9e9387b07ca6c49b1118"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.42.0/simpletunnel-darwin-amd64"
      sha256 "4e437a321d88ffc347d1edf781b0a29f306e52baa4002f5df7b68b365914a289"
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
