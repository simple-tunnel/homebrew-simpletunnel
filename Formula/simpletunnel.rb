class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.71.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.71.0/simpletunnel-darwin-arm64"
      sha256 "8ade2e6079a5e3159dbdb06593a846a23e8f5dfaf9bfb7d2bf2a1e1680b10bfb"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.71.0/simpletunnel-darwin-amd64"
      sha256 "2a7bb533aa9185ba27ac4dbdd7a204d3155f74344dc589361cdcc002c4d48f4e"
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
