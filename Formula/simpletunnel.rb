class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.50.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.50.1/simpletunnel-darwin-arm64"
      sha256 "8fbfb2ee2ab3b8891d3c79a790aad05a9b222f626823202318f19b676af59136"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.50.1/simpletunnel-darwin-amd64"
      sha256 "ecc2744634657e2e05c4be727a284386c0759c2f09d32add149986867a9af047"
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
