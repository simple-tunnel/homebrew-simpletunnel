class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.15.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.10/simpletunnel-darwin-arm64"
      sha256 "77bee438121a1af30e6cf9ff089653c7099e65a6da34055e9a7796a4a0e6304a"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.10/simpletunnel-darwin-amd64"
      sha256 "b10c43777dcbde200dc0b09362ef57f51d3fa28cc1d141027ec373a89dbbebff"
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
