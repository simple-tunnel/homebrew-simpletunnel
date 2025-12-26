class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.17.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.6/simpletunnel-darwin-arm64"
      sha256 "b16364861f0b3222f34ff3475c36803a10c04fcedaedee427de590bcaa1973cf"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.6/simpletunnel-darwin-amd64"
      sha256 "3ef3d90cafe4412ae7c3be7d2607fd6bba12a375c572d0a6e41fe0f6b5f98914"
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
