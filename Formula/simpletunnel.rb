class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.17.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.14/simpletunnel-darwin-arm64"
      sha256 "e4a7fe7a56730f9312e8598e831e0c290f18456090ae3b469e884defeec91285"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.14/simpletunnel-darwin-amd64"
      sha256 "170876d4d57fbfa81946e77440db268ea710f5244d87aefa4fa63e478c5cb6d3"
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
