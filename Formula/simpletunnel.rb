class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.59.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.59.0/simpletunnel-darwin-arm64"
      sha256 "858cc1928dd679bd69be5a6a01f2af9ebf5e6da2829e253689ebf2e76686ecc3"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.59.0/simpletunnel-darwin-amd64"
      sha256 "27abc290620322764d9e4ad62073a7f0af3a27d0a938435ff560024fb5222d80"
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
