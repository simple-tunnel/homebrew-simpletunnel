class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.25.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.13/simpletunnel-darwin-arm64"
      sha256 "e5f6f7997566caa9a520f8c21fdbc8f7a9edd023ca0e33126f68741198f9bd95"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.13/simpletunnel-darwin-amd64"
      sha256 "767854beb3c499d6f6c4c23945c7df2c0db1fe8d626dc036de683e7a3e30ad53"
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
