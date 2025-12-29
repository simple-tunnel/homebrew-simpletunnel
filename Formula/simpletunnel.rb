class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.22.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.11/simpletunnel-darwin-arm64"
      sha256 "a8adeb23e338e7bdc4e859e0263415fd171e3bcd2560629dd8d75288efa9ca08"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.11/simpletunnel-darwin-amd64"
      sha256 "e028eee9854e7450fba0a03f2b202f5a0159457aa46004c70498c13942889ff2"
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
