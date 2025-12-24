class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.12.0/simpletunnel-darwin-arm64"
      sha256 "bac681ba204fb47d8c2dd015da84e94aedf412c2e04b14ab2c6a13ae577a2f42"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.12.0/simpletunnel-darwin-amd64"
      sha256 "97342c387c763b2189e21b761cc381415688ba26414f8de036e32a00fe30d114"
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
