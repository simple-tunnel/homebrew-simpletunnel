class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.53.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.53.4/simpletunnel-darwin-arm64"
      sha256 "4f43d6a73b0d9b8a72351f8edceb1ede4f6625736b4856f814c5707493c2d7e5"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.53.4/simpletunnel-darwin-amd64"
      sha256 "1b19d87de0c517125b6512707dd951abf6260f14379aaa50c27456f672e4b3f5"
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
