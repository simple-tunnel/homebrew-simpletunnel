class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.5.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.5.4/simpletunnel-darwin-arm64"
      sha256 "451f288bd2dc5665b335ce7450a46b90130da43bda4b53972289f0e6b70e1a49"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.5.4/simpletunnel-darwin-amd64"
      sha256 "b2a0bac01ae9244d1e2c7739b5aa85c75cf78be0bb371626079708be3150e062"
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
