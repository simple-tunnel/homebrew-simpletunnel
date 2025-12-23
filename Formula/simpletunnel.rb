class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.5.3/simpletunnel-darwin-arm64"
      sha256 "f524d19a7d0d937fd13dfc1d39a9754dd1830f04cd3397198cd9aaa8afc629b4"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.5.3/simpletunnel-darwin-amd64"
      sha256 "e9486fa022f7b77cec545b6e7016c9a55197c7f261c11e2582ba1ef06a131745"
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
