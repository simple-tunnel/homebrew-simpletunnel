class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.64.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.18/simpletunnel-darwin-arm64"
      sha256 "326d1b43c4ad5946472eba5ebc3476b3ad3352f77c3155fd8fe27675ccacba1e"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.18/simpletunnel-darwin-amd64"
      sha256 "091fbef2ab0160f180b5f25480e63f0d10b461eae199580c3a668e4b854ad180"
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
