class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.27.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.27.2/simpletunnel-darwin-arm64"
      sha256 "a60424165c52583986627a1dbb001cf4626b8d6c18c0a01fab6a9ef7fa2ecdc0"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.27.2/simpletunnel-darwin-amd64"
      sha256 "b458c817f5aada7b56e907e75d08327b70dfb01ab72af9d66832dd13dc634c8e"
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
