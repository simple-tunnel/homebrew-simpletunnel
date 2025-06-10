class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "1.6.34"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v1.6.34/simpletunnel-darwin-arm64"
      sha256 "801998204fe6ef99c75d4f2a2d6d34139e89e3bcf022c5412b39607519e51527"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v1.6.34/simpletunnel-darwin-amd64"
      sha256 "801998204fe6ef99c75d4f2a2d6d34139e89e3bcf022c5412b39607519e51527"
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
