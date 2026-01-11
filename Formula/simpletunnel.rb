class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.52.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.52.1/simpletunnel-darwin-arm64"
      sha256 "46d954540ac38db62307c89d65a5e6ff382dbe8a0040889d2d2067494f2e065e"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.52.1/simpletunnel-darwin-amd64"
      sha256 "8f1610f4325fe4b56b0eaf99774d6aed8cd9590f3803aa142f3c484cb921891f"
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
