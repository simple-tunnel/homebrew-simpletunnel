class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.24.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.24.5/simpletunnel-darwin-arm64"
      sha256 "f79e65430a808e86e59293aa6bcf69c8178b54efaee77a83b846a09235854299"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.24.5/simpletunnel-darwin-amd64"
      sha256 "8aadeac1ee21bb72748c73353077bf1b8de03e139756e094704bea3dc4030d13"
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
