class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.15.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.11/simpletunnel-darwin-arm64"
      sha256 "d9a21a21d226a0599fc41a41e7be26144a68ef5a7c32f6d227a2693b3d91f927"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.11/simpletunnel-darwin-amd64"
      sha256 "af00e75b7c08ada825e3e766cc2f2a23b9214f7f6002734543acb9f76a3a6162"
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
