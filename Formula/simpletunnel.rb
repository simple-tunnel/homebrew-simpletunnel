class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.78.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.78.3/simpletunnel-darwin-arm64"
      sha256 "f61e5b62c4dad76f9d6eeac44a458cc0cf0baef220d264f9bdf21c4c9d42091a"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.78.3/simpletunnel-darwin-amd64"
      sha256 "fe8a3f02ded508c4f026e1b7aead999371a2a284b2548ed7c6f8cae8f6917a97"
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
