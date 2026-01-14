class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.54.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.54.0/simpletunnel-darwin-arm64"
      sha256 "992f72cbb5382d04efc722bea93f3ad7b021b70313293a938bf6be0add60dee8"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.54.0/simpletunnel-darwin-amd64"
      sha256 "13f207986fc708293651eaefb2ee689d85c6a2a01e47c08667bec5d01fd4925f"
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
