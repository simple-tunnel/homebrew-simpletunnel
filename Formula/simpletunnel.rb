class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.17.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.11/simpletunnel-darwin-arm64"
      sha256 "65b05683f817b39411bfc42ba624a5727f520da03ad8aa1adff3712299401de2"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.11/simpletunnel-darwin-amd64"
      sha256 "4700bc1b8989f09f7524f1c7ec64e014da1183f9bd9b24064e347f8687907815"
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
