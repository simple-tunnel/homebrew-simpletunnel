class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.7.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.7.2/simpletunnel-darwin-arm64"
      sha256 "17e1b790da0a166c6add5e88b77f3ef85f6d4c07be082936dbcbb3c2f9fcbfc6"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.7.2/simpletunnel-darwin-amd64"
      sha256 "dbb31c0075b7fb79e08a8962ed6d6d9b05d85491336ed192e2267c0c904c8caa"
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
