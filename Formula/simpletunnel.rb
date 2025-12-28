class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.21.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.21.4/simpletunnel-darwin-arm64"
      sha256 "181297555085d6e30cdaf577883f306e190c2e4363baddc16dd2935fe29454be"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.21.4/simpletunnel-darwin-amd64"
      sha256 "6a01345694965e5fe4c4d7763c635fd8323b302d72e7cb71740ac3b7a22b53db"
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
