class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.25.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.3/simpletunnel-darwin-arm64"
      sha256 "772f04260e834208d94dc6eb75884f502508bd45a550dcf1258a846039385817"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.3/simpletunnel-darwin-amd64"
      sha256 "d862175f72a2e74814f6767824f3d09ac65b61d04b8686b08ff2e2e2fc5505a7"
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
