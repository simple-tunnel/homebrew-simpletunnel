class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.64.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.8/simpletunnel-darwin-arm64"
      sha256 "86dbe5a31afa8dfceaf8fe12a4056f6f9e9737c628da503ee227e4e3bf28e5ab"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.8/simpletunnel-darwin-amd64"
      sha256 "8c91df24dc2238abbae3e3dae377ca2256e052759e5f78b2c8d7c7018a4b06d2"
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
