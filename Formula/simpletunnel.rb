class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.34.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.34.6/simpletunnel-darwin-arm64"
      sha256 "90d237e0e1a8d7e6be02b4ada1b81f535040792679b56922261a3c3d045cd676"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.34.6/simpletunnel-darwin-amd64"
      sha256 "57b675d6228a1d6d2658211ab9592b6544c0454e32a7d7150df94ce0f9acd769"
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
