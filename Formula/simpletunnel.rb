class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.11.0/simpletunnel-darwin-arm64"
      sha256 "6a7d6f60ef1f39b6fdbcb8718a3310b9cbda4cbf7b81700e95c0eeb14dd124de"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.11.0/simpletunnel-darwin-amd64"
      sha256 "b1d09dea7d6c374fdb17146dfebb8a330e2f146a09b2a6ca97520f0cf26831d9"
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
