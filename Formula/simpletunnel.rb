class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.69.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.69.2/simpletunnel-darwin-arm64"
      sha256 "7ca0c09608ef693371f03e69909b3234a52019335b6887925ebdc1a1ed68a0df"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.69.2/simpletunnel-darwin-amd64"
      sha256 "7db05e69d2d990b592ad891c445d1936c9ede6de0205dee1d8703899d4d25835"
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
