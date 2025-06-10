class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "1.6.44"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v1.6.44/simpletunnel-darwin-arm64"
      sha256 "f9620c4203ce20368b29c77700b8d64d7d4134ef113606adf0b931dad5aa5fed"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v1.6.44/simpletunnel-darwin-amd64"
      sha256 "f9620c4203ce20368b29c77700b8d64d7d4134ef113606adf0b931dad5aa5fed"
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
