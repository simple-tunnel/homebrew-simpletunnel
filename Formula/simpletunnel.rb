class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.22.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.12/simpletunnel-darwin-arm64"
      sha256 "542192accb89a55d932087bbc0d0423fcb5e3330085d268ce989192ca51bbcc7"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.12/simpletunnel-darwin-amd64"
      sha256 "346112c64361ff311d2dde2898bd8cd8b96e3475dec013c0e4e3308fb07f5b21"
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
