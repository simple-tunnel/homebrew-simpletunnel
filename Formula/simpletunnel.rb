class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "1.6.38"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v1.6.38/simpletunnel-darwin-arm64"
      sha256 "1f7521a55d240c13d3cbfe0e147ca2080c02e9887f90aecabb26b0d7fedb0b4e"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v1.6.38/simpletunnel-darwin-amd64"
      sha256 "1f7521a55d240c13d3cbfe0e147ca2080c02e9887f90aecabb26b0d7fedb0b4e"
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
