class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "1.16.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/homebrew-simpletunnel/raw/main/releases/v1.16.2/simpletunnel-darwin-arm64"
      sha256 "33ae3e0a0178071705379a082f8cd44cca1b7efcd64c9e737155a9b5f23ace69"
    else
      url "https://github.com/simple-tunnel/homebrew-simpletunnel/raw/main/releases/v1.16.2/simpletunnel-darwin-amd64"
      sha256 "33ae3e0a0178071705379a082f8cd44cca1b7efcd64c9e737155a9b5f23ace69"
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
