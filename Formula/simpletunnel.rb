class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.52.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.52.0/simpletunnel-darwin-arm64"
      sha256 "05078bbde89eb61950e6c4d092cf4752ecf25c8b78c561434c2dc1c04559d339"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.52.0/simpletunnel-darwin-amd64"
      sha256 "de70bfc7062aac15ea0c255dfd5f7d00d0e52cecec7e61bb4cefa01dbb5c5c22"
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
