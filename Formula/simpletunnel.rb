class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.22.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.0/simpletunnel-darwin-arm64"
      sha256 "e63f5e6c62cac5bc2c05ce32693cc0857b82b868450f06847b3a5cf76f73ab95"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.0/simpletunnel-darwin-amd64"
      sha256 "363137f61aba3ab26db63c315de5578655a6de3ba0914df72c6d1c2ca0046476"
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
