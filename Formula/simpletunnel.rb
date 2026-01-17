class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.64.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.5/simpletunnel-darwin-arm64"
      sha256 "cc6267a2f92742d3d89da0b8210e784fcfc8c6f18e0a84d9c9068f4a5abc1299"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.5/simpletunnel-darwin-amd64"
      sha256 "e90f4ca7a37874cda6c30696d545a0664f695afe1faf1743331afb80b41548e5"
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
