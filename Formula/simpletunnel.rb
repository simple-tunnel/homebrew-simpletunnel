class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.55.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.55.6/simpletunnel-darwin-arm64"
      sha256 "230037efa8349bed60715bc21b0e19e72dcb3eb999e007b56dceb7f7a531eedd"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.55.6/simpletunnel-darwin-amd64"
      sha256 "9e53074943cf325309312a76cbd40a2a103b658db5f4107fe3e1d9d1197a6639"
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
