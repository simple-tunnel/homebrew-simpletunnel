class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.55.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.55.5/simpletunnel-darwin-arm64"
      sha256 "20b060323dbdae918904fe53d003a44b32e0100459fc669a61e6a919b5e770d0"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.55.5/simpletunnel-darwin-amd64"
      sha256 "5b01d3440ac1f65d11c8401919785f6e0b8a82edb8a5136abd76f8fe794b5fc1"
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
