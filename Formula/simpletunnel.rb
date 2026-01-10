class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.48.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.48.1/simpletunnel-darwin-arm64"
      sha256 "c95a685af0ee8d1be64ebf0cc51175e0325ff190ea1298279e82c6ef1c99889b"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.48.1/simpletunnel-darwin-amd64"
      sha256 "cad0185e0f2c3bf7f75eb681d9073d9a48ad824220c808595129a4d70fe4d802"
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
