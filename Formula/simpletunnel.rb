class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.47.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.47.0/simpletunnel-darwin-arm64"
      sha256 "39697530cebf947752af75b1945f66c953574a64aa59a9496f0b8c60ea3385a1"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.47.0/simpletunnel-darwin-amd64"
      sha256 "ec2b785378f674fc32abb84f98d62bcb21dde8d4b987609042bacc0e3aa741b2"
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
