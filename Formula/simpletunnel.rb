class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.64.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.9/simpletunnel-darwin-arm64"
      sha256 "01b233c5f2d83401501560087b4f099fef10a7f68d3bb2f0aa7701039d3374b7"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.9/simpletunnel-darwin-amd64"
      sha256 "4938484d4cae007045e9cefed7025ec9782af832b30dc1fd592c249b1ae4aeba"
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
