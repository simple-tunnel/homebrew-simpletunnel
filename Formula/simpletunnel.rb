class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.22.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.22.1/simpletunnel-darwin-arm64"
      sha256 "c7f2a82fa21d99f61dd6944dc67fd929d55434c66c8267f2bbb2b367c15f38ed"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.22.1/simpletunnel-darwin-amd64"
      sha256 "7643eb206deec8a1f86d848884684ee5196f01536bbdef27a68ca7d7495ada12"
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
