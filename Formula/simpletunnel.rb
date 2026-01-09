class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.40.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.40.1/simpletunnel-darwin-arm64"
      sha256 "ed589791475ee1b5ca96a35131b67291e7710f1fb18a263563b6521dad8873c1"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.40.1/simpletunnel-darwin-amd64"
      sha256 "19e6a57c086572415ac9dfd3655514c709fd1627f9b16c711ca5397368370bc5"
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
