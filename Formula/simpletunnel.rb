class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.8.1/simpletunnel-darwin-arm64"
      sha256 "fd6101ae2eeb5b9a88c8e38b4d6498ceb98bc4563a6691f36c879abf51072344"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.8.1/simpletunnel-darwin-amd64"
      sha256 "08d99e0efde6693071814eb67ab1cf7e65e18195966778c786fac49d370c4aa5"
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
