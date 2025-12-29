class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.21.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.21.7/simpletunnel-darwin-arm64"
      sha256 "5b9631135556903cd11ff5b596e89c2d4834883c7d0d4f869e5cdc6a765a3050"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.21.7/simpletunnel-darwin-amd64"
      sha256 "9b31c14b0f5d4b0caebb179de30b06efcb9af229d0e9d149c7b4827fc7ba37ca"
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
