class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.17.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.5/simpletunnel-darwin-arm64"
      sha256 "e0124f4bf70493fa8d387bbae370e61fdf862f3cd817e292baaaf17f201dff1a"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.5/simpletunnel-darwin-amd64"
      sha256 "fcfe35680119a925f2a9b09aba98cfa5d5414560ca93b42781aaacc205b3cd61"
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
