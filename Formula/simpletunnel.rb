class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.2.85"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.2.85/simpletunnel-darwin-arm64"
      sha256 "39751ae3e7355f5cdafeeca20cec7829d4e758346817f288d06424a52c7d651a"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.2.85/simpletunnel-darwin-amd64"
      sha256 "c9e1a1578b7749f316ed96027449b6afeac15e0797a9a1e9cb7273e2dc4c3e65"
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
