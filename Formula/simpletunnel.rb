class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.64.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.7/simpletunnel-darwin-arm64"
      sha256 "875c24184c037f1e4b415e42c604c2b524f28805a2a8ea1206c0e9ea8ed514ae"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.7/simpletunnel-darwin-amd64"
      sha256 "7d2f6806ee4e1f85ba20d1bdc9cc1cff31de005c40a1a3295b8246f6e6d9f547"
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
