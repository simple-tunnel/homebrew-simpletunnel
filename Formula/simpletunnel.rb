class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.15.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.12/simpletunnel-darwin-arm64"
      sha256 "7c10ff3797e6e399000964c5be7dcfd4632e3a75da1e0f42ae924c42f8606fe5"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.12/simpletunnel-darwin-amd64"
      sha256 "22db33116dbdf67b46814bb8d3d80211bead9f076ce93bb8461f683cd502365f"
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
