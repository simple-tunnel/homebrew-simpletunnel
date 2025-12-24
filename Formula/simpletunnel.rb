class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.6.2/simpletunnel-darwin-arm64"
      sha256 "745f73c4953028ab317b59363b383c3765dd4684969654a38b70f9d7b942b04d"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.6.2/simpletunnel-darwin-amd64"
      sha256 "722337d62279acd9ab7b3e9a2f022e3672fd0d3788a20a0a4223c704e1bcb606"
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
