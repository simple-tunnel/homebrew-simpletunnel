class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.58.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.58.2/simpletunnel-darwin-arm64"
      sha256 "6c3b6db8eca3985e60deffc99d62a139093f54976f328c77893741d9c6938406"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.58.2/simpletunnel-darwin-amd64"
      sha256 "323f01600138f25b967a14c459992a53ad7f1ab5f19e7abc6d32ea15b0095ec5"
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
