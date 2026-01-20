class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.80.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.80.0/simpletunnel-darwin-arm64"
      sha256 "a4c6243e79a5276113470951cd0ee8c3c89f551762771e48b720e47589a63b5f"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.80.0/simpletunnel-darwin-amd64"
      sha256 "a9b0402e2629805ccf5e840df6f65717c4336c7d396df44568713cb65d6fb47d"
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
