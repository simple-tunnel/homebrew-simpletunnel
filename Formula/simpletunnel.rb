class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.64.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.17/simpletunnel-darwin-arm64"
      sha256 "e411644f0bdc2d70497bc0c6d56a391afbacbbfa11aa187c30017a664677a0c0"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.17/simpletunnel-darwin-amd64"
      sha256 "d7a81459276e6d7c8f38fc9e41e860c010ed02d5644db4dbefbace93b7b83b2f"
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
