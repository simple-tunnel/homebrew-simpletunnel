class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.61.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.61.2/simpletunnel-darwin-arm64"
      sha256 "f9873e893e4f63ba0800480af70cd1af6f4a8d41efb757bf71329a8b372386b1"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.61.2/simpletunnel-darwin-amd64"
      sha256 "b78d9e16b7ffc7781a5a060568c5777b97dc2633506e74cce9934cdabe8259f1"
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
