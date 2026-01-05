class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.34.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.34.4/simpletunnel-darwin-arm64"
      sha256 "a3b8e67aca0fc83c5c31b9b9c0cd9e725010435f41383dab8014650548bbc423"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.34.4/simpletunnel-darwin-amd64"
      sha256 "e004fdae1763cbced23e572120f0a84582dc87a328cb068921e5c417fef97471"
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
