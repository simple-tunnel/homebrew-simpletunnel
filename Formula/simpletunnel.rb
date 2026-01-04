class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.31.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.31.2/simpletunnel-darwin-arm64"
      sha256 "5ddb0e308d9b7b7df005b36983a6c9c1bdef25fbe0a8b58f0a356657f302a405"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.31.2/simpletunnel-darwin-amd64"
      sha256 "dcfe0feb5bff9a6dc471fa916b3969150253a6e8b3e6030da1a437d7be7f5b08"
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
