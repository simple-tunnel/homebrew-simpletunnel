class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.15.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.1/simpletunnel-darwin-arm64"
      sha256 "970dac23bd498a432f3f5f66f5cf8548cec23bd65aef4480b12a821a2da74114"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.1/simpletunnel-darwin-amd64"
      sha256 "2103f04fdd4887c165b67082bb18699b11961ed6b116872b749ef484002694d0"
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
