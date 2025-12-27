class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.18.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.11/simpletunnel-darwin-arm64"
      sha256 "0a7b641e4b2ea3292cd5b149eb1bccd6a94c778b962f28e8b4b9de9657e3e25f"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.11/simpletunnel-darwin-amd64"
      sha256 "19303dd317e778ad5cb11c333070c65e0b5b4bac45ce782ede4032d9fb48cf87"
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
