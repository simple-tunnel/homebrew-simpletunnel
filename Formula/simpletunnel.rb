class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.18.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.7/simpletunnel-darwin-arm64"
      sha256 "3e1cd7c3e860eb9c7680c31c3cc2a895f02c6ebe55901762a215b09533efac28"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.7/simpletunnel-darwin-amd64"
      sha256 "0b19e1d9a7b586932ba825ba2060448ed5d4c5d308a463a47e7b54b5c75328c0"
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
