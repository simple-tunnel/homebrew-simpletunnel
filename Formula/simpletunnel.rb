class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.17.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.2/simpletunnel-darwin-arm64"
      sha256 "a87b6d82e4d1a96043a0d0caf4a71b20fe34dcb7b5286f8395d4ddd6d91852e8"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.2/simpletunnel-darwin-amd64"
      sha256 "ac780b74c84a2dbabbcf4fe42faf4bc1fe4d80b1c6fc05cbd895ab5e5702a4b3"
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
