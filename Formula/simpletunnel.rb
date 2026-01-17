class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.64.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.16/simpletunnel-darwin-arm64"
      sha256 "4de063ef1be496fa850e181ad7d3cb9b7c5c67ddb32815f113b9e0d7ca4d01e5"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.16/simpletunnel-darwin-amd64"
      sha256 "8e9d43b9968f86ea3bf8ee99f177fa811be0d2cd2d309f2687ace79987187179"
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
