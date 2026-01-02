class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.25.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.12/simpletunnel-darwin-arm64"
      sha256 "6be348b6618ace0383c8ea2d1b58c77c6c55065041f02ef6fab3e4ad9bf22ba4"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.12/simpletunnel-darwin-amd64"
      sha256 "08150b69ee17eef3dda6c03399249c2ce5d73c27273791636aaf8c0431667f23"
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
