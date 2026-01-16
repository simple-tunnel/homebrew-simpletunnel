class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.62.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.62.0/simpletunnel-darwin-arm64"
      sha256 "cac5292280194a048a0c1a24f1cf14e1c747ec49e24420e6c974c633b4dd470c"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.62.0/simpletunnel-darwin-amd64"
      sha256 "918fcbbd5d0ee0ac434ee59ee603886fa0eafe40b8a835b7834a7db4206fcff3"
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
