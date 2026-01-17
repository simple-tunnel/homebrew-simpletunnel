class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.64.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.15/simpletunnel-darwin-arm64"
      sha256 "15175723c31b624e44c9aa761c034c53b0d2a5a43d9551139e4289e2c0bccaa0"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.15/simpletunnel-darwin-amd64"
      sha256 "daeba8e00c97cdcee02ccf3a469530fd89e724cb35caf035cb0cec7a74a92cbf"
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
