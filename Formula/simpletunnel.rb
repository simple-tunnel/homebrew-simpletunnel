class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.1.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.1.17/simpletunnel-darwin-arm64"
      sha256 "1be6d61a9c03d3707809d9a6cff85c12f62bfd4a6bde04f5a0d5d713d13b15f7"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.1.17/simpletunnel-darwin-amd64"
      sha256 "e80a01f3f0cfe125c17ea9383a35095d25d3c13857977f5ba19e2c964c9682ae"
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
