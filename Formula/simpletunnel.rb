class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.17.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.13/simpletunnel-darwin-arm64"
      sha256 "e9c77db460a927c54dde34e2d2c5e22227c4624b1ac16fbf084c7e67a5374ddf"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.13/simpletunnel-darwin-amd64"
      sha256 "9a3df7d86f8bc2fdad0dddd9b653c137b27b474478506968993fbafe9244671c"
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
