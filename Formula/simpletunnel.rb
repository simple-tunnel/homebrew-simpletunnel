class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.2.63"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.2.63/simpletunnel-darwin-arm64"
      sha256 "ced97452c020f4c5c178940bcf7ae634a938d53b6aab7dd13964693543bc3505"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.2.63/simpletunnel-darwin-amd64"
      sha256 "aff2c4e79a96c7784a1659879b6214228819172af381c5925b6917a2183313df"
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
