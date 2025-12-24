class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.8.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.8.3/simpletunnel-darwin-arm64"
      sha256 "ed04fa9a578c5931830c40716b9cfab580075dd31eb24fb475c8ad384bebc69d"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.8.3/simpletunnel-darwin-amd64"
      sha256 "cc2aec295247959b882a181a82ba1db06a36d3d3f4da9e9353b3dc24d1a80b94"
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
