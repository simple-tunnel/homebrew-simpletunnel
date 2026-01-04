class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.31.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.31.10/simpletunnel-darwin-arm64"
      sha256 "d6e167c88ed1ee2dfbd5ebb4f520bc1b83fa8316ea1ef9b450e8c4dd5c52c43e"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.31.10/simpletunnel-darwin-amd64"
      sha256 "053556a1d9a5288b6504000cf802333e06a340dcbafd3fd2b7970a8f28337064"
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
