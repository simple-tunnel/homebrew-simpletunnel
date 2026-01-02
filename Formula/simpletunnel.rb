class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.25.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.0/simpletunnel-darwin-arm64"
      sha256 "5d3da5597a90246f04776a7523ff69c11f92e6ecf383a5aec71f44688f8a9119"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.0/simpletunnel-darwin-amd64"
      sha256 "b055fd2d765540c0f363953070ff0c19432301f91a6601b978bbb5f43306c4a3"
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
