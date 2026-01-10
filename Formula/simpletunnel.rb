class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.47.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.47.2/simpletunnel-darwin-arm64"
      sha256 "f2aabd81ea4d5d799062d280c8b2f10882f1a1ada505d2d13b06893e5c9ee434"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.47.2/simpletunnel-darwin-amd64"
      sha256 "f05fa289879181cbc51b9b43c53c7d9df57436870f305dc0e77f043f385a7c4b"
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
