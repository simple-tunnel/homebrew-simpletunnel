class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.25.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.11/simpletunnel-darwin-arm64"
      sha256 "accd33e2974dffaea72653a20b7e53172a531e53a9b7efc13c7e5472443d5683"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.11/simpletunnel-darwin-amd64"
      sha256 "bde7443c7d2d2a2ba90a41cf5189d5c84e7d65d9ab46f101437a551a98336659"
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
