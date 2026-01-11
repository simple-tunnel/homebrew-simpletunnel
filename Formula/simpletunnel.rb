class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.50.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.50.2/simpletunnel-darwin-arm64"
      sha256 "71476cad00ff70ab7fff515b95fad6733c7f8b2c808c612e70d8cd9d4ff01ece"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.50.2/simpletunnel-darwin-amd64"
      sha256 "146c1ce705ded25cb97ff6b0f9dd26676ce50a947c579cbf4911a1d6668406ae"
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
