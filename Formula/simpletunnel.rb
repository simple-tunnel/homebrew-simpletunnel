class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "1.6.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v1.6.15/simpletunnel-darwin-arm64"
      sha256 "5bae55e22c12661e0dc7f27c67886da2280fc5dc43d57001e7cb149ce62ae964"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v1.6.15/simpletunnel-darwin-amd64"
      sha256 "5bae55e22c12661e0dc7f27c67886da2280fc5dc43d57001e7cb149ce62ae964"
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
    assert_match "SimpleTunnel", shell_output("#{bin}/simpletunnel --help 2>&1", 0)
  end
end
