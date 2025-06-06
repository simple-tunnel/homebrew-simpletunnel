class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.6.1/simpletunnel-darwin-arm64"
      sha256 "5a4f4d088a8c099483b70d65bc98ea3047923ab9ac1e380034931d5506def8fb"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.6.1/simpletunnel-darwin-amd64"
      sha256 "2b1c8923a8f5c49c4274a845f9e3caa764456dd879ef94b979bb74ec169ee398"
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
