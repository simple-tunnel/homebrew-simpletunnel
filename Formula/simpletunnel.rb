class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.4.0/simpletunnel-darwin-arm64"
      sha256 "c7b3b1df720475c053cdede658d59bdd0f7b30fdd988e722d9327237d69603b3"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.4.0/simpletunnel-darwin-amd64"
      sha256 "6bad1a33d3e7cb89560615366b64b69aa5460e0c62ee7fb318813341a4a311ef"
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
