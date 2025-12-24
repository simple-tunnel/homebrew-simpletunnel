class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.0/simpletunnel-darwin-arm64"
      sha256 "19a5eefbe2f6f5ce600e5fc74f59cc3f533311d992df2c7bbc9faffb234f3f96"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.0/simpletunnel-darwin-amd64"
      sha256 "2f7c69a720a4b175aff21b0e7d7e5db63923be7a52d21f583edc3b2d6caa68bb"
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
