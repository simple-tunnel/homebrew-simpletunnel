class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.9.0/simpletunnel-darwin-arm64"
      sha256 "9d914d6a95cd44647e70c1efd963de1bb1a316bb8052f8a5f447e838fc1a5cbb"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.9.0/simpletunnel-darwin-amd64"
      sha256 "fbb1ae60bdcf1a5cd3f9756ab4e65e18141639b478a6fd745678eacb5aaa0e44"
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
