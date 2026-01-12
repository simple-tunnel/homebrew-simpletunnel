class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.52.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.52.7/simpletunnel-darwin-arm64"
      sha256 "4e6a0d8eff2cf84efe335561cd9dd548462ecf6563d8d9d6d24f938f82f73567"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.52.7/simpletunnel-darwin-amd64"
      sha256 "052faadf48c6d3360b2d1135bb24440fed05c8f659811ed6947954638bea0478"
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
