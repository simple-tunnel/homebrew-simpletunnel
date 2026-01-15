class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.57.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.57.0/simpletunnel-darwin-arm64"
      sha256 "80d7ed1ed85c99f9f4797865bb5712ae9bfef70118c345f6ee3934e79cab9f31"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.57.0/simpletunnel-darwin-amd64"
      sha256 "710aff31c604182f6e394187bb497611d9f4f8d4757b69e096d1c573d822a3be"
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
