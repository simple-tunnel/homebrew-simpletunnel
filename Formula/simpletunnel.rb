class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.53.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.53.5/simpletunnel-darwin-arm64"
      sha256 "7606d766f9a6f78483071a0853e995e8a59b19edbecc8a880d63baa533d527a7"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.53.5/simpletunnel-darwin-amd64"
      sha256 "82e05793064c1b0b8d6d4962772abc6397202205f8ffbd1eed7a765d2f14b451"
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
