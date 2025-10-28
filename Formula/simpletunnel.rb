class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.2.64"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.2.64/simpletunnel-darwin-arm64"
      sha256 "ce6e764b2ee3acd88dd6d69cc3e25cf05af408b37d49c2469e3fcc85d4209be9"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.2.64/simpletunnel-darwin-amd64"
      sha256 "26bc6cf804f06d6ba6a2095bdb35214d2147b910ef8a7401cb95ba00b1d99e9d"
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
