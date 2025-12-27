class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.18.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.4/simpletunnel-darwin-arm64"
      sha256 "8a2cf473b0f7ca67a89b4e8b3c6fa0000d5634d7c5503509fe8ac9bac7f48262"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.4/simpletunnel-darwin-amd64"
      sha256 "b99255902859cae1267b21cbed6a3dcdc721ad02a02388e2dc99641b1234a55b"
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
