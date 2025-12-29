class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.22.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.13/simpletunnel-darwin-arm64"
      sha256 "d81699f76f9b4e405ef1e5ba53f60661772e7f17d15e021e927c6b360fab1b24"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.13/simpletunnel-darwin-amd64"
      sha256 "348e865d9e3e548e9a6a3c6315748e68e06eecafbc744b64b05333dc2dc2249b"
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
