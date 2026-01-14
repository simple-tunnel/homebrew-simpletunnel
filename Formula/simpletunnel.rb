class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.55.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.55.1/simpletunnel-darwin-arm64"
      sha256 "b000fb2e56903d37eed8659c98f0fd729f7594a3326032544e3cdc27f0892036"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.55.1/simpletunnel-darwin-amd64"
      sha256 "ebf37fbec3c4e0de11c8a98acde7ae6feb57fde2d5e92d206bf87c43142e35fe"
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
