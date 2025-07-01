class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "1.16.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/simpletunnel/releases/download/v1.16.12/simpletunnel-darwin-arm64"
      sha256 "56fd2fa0b41d6411a05299a715ed12f8e580efde50e78ba82f98c88774edec7d"
    else
      url "https://github.com/simple-tunnel/simpletunnel/releases/download/v1.16.12/simpletunnel-darwin-amd64"
      sha256 "56fd2fa0b41d6411a05299a715ed12f8e580efde50e78ba82f98c88774edec7d"
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
