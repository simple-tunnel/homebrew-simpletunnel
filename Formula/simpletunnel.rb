class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.22.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.7/simpletunnel-darwin-arm64"
      sha256 "f393282b07fc74cd8c6d9bc0eff1483e86094524fa9eb074251041fab85a80c9"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.7/simpletunnel-darwin-amd64"
      sha256 "6c9dbac17182c0d9af557b0d28f11daa449ca1ac5ec69e0655dfb0ffec2c7fb5"
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
