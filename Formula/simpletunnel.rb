class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.1.0/simpletunnel-darwin-arm64"
      sha256 "26ddb2aa75a1304749b70cdc72491acf4589fd9b5807d07bded8cbc01969916c"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.1.0/simpletunnel-darwin-amd64"
      sha256 "3d182f25453c20f92e57a9f1ea40d62570d2ebc712b42c3894adc3ad0da2ab45"
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
