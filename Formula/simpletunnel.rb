class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.63.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.63.0/simpletunnel-darwin-arm64"
      sha256 "7b3af1c6257fd317b881ed44861c0d1c83208327d677ec0b4a61c9a5aaee193c"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.63.0/simpletunnel-darwin-amd64"
      sha256 "14795bf91ccc284051093a9908d5c0728d60b0438248b3a74bd52701ae5922fa"
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
