class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.64.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.3/simpletunnel-darwin-arm64"
      sha256 "fc7e999566d3c51ff6e0bf92b83e6901112c4993c9f2f8e4705457e23cfcecba"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.3/simpletunnel-darwin-amd64"
      sha256 "75e29eb5093a66271969124263642ad786927814a1367d390627319921534411"
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
