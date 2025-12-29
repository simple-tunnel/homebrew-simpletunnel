class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.0.1/simpletunnel-darwin-arm64"
      sha256 "a5f7b43501573af2b047e9a1252efaa9c7931029bcf27a84dbe97ce50bdb4505"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.0.1/simpletunnel-darwin-amd64"
      sha256 "73812758e07fcc6d2c5c1012c6ccce5ee51366194c0e038d4e2075575fac3b27"
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
