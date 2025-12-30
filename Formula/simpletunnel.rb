class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.7.1/simpletunnel-darwin-arm64"
      sha256 "90410f3c58966d96dd6a47cb3354f643271f42f31d04a3eb127e8f41776caa8b"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.7.1/simpletunnel-darwin-amd64"
      sha256 "be7dcd901054905716a87f244e22a7549dedfd6165c2381df7fa95cd966b0a2f"
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
