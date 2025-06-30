class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "1.16.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/homebrew-simpletunnel/raw/main/releases/v1.16.7/simpletunnel-darwin-arm64"
      sha256 "c6f6595860360b7706ce460b6c87c48861a3d1631df3c71f9109d8f3425b7fb0"
    else
      url "https://github.com/simple-tunnel/homebrew-simpletunnel/raw/main/releases/v1.16.7/simpletunnel-darwin-amd64"
      sha256 "ade4315c19768900e0fd4345da577ad2b62631acda9e4ff72e8848380de78e32"
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
