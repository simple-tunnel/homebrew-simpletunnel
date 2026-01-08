class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.39.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.39.1/simpletunnel-darwin-arm64"
      sha256 "b872ff9aff5098c2d9d4d06c70d47faf76031e758588e5feaf67b9e04984f823"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.39.1/simpletunnel-darwin-amd64"
      sha256 "57fcd11a24e4713827796edc4a5272be58479cee1a8087d216e6b2df58d4b434"
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
