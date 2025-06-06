class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.6.0/simpletunnel-darwin-arm64"
      sha256 "00712c4add0647f585c5059a01815487c01c81ce6594720a6c5e90b053bf59d4"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.6.0/simpletunnel-darwin-amd64"
      sha256 "f0064033b9e163c36136d3a8fd9c9a2b14125f9b18196137ab8cbdbc88a11809"
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
