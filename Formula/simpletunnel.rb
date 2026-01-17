class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.64.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.1/simpletunnel-darwin-arm64"
      sha256 "af0c444415b6e77b0f09a4bad2ae3bee611d206f85b5c2f7363019e908c1e841"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.1/simpletunnel-darwin-amd64"
      sha256 "0d6ea361b3e1ccd3320e55b2fa2af9aca143057954a30dd7de3bca09d1c02c97"
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
