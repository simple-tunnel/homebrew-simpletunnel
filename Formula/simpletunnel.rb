class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.43.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.43.0/simpletunnel-darwin-arm64"
      sha256 "1011cea589e71bdaeb45b90545b8a3c7be56e3a88db2e4d63c36888d278a0538"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.43.0/simpletunnel-darwin-amd64"
      sha256 "82a05addc6d2c54e6ddbf4db58f4176862443011f5dedaba8ca7a60633f9b199"
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
