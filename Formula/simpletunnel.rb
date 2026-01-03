class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.27.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.27.1/simpletunnel-darwin-arm64"
      sha256 "5d04b7bf8ce12284213bc287595adc908f25c7f10b9e7a1bebca62b22bf3a223"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.27.1/simpletunnel-darwin-amd64"
      sha256 "c7878d2c4e52292dc84075e413f3a5947fae4d5756c041650371afedf2eb7e41"
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
