class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.58.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.58.1/simpletunnel-darwin-arm64"
      sha256 "5ea9d26bf04c1ec16602973feecc7c6aee41e7e6d3fa6ebc7c98c6d9d949a865"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.58.1/simpletunnel-darwin-amd64"
      sha256 "e3bde4d7cbc2aaf6a4e313f0450434942cba44a3c0dafb4cee5649d6e301e3f9"
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
