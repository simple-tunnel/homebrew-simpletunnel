class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.79.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.79.0/simpletunnel-darwin-arm64"
      sha256 "2bfecb505193d87fbc37dd47e5dec13d205b7546f67c08d81131c7226c90572e"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.79.0/simpletunnel-darwin-amd64"
      sha256 "2e3cf63f830c9cd32a4c6bc038aa1d032ec1f00f7ac2cc03dd07a7ef2878a65d"
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
