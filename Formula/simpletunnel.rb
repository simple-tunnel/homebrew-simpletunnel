class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.55.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.55.2/simpletunnel-darwin-arm64"
      sha256 "a519319fc14334538fd8a22a7c09e51fdba645f91fa30c4f38bdf5c2db071a58"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.55.2/simpletunnel-darwin-amd64"
      sha256 "6bd3d40604f86595dfe187a0ef45723ab7a261ed5d144b10104e0bf765c3b396"
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
