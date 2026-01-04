class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.31.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.31.9/simpletunnel-darwin-arm64"
      sha256 "9f3781bc8b218a9b37e258f865ff0fca9a306630869b49ca7e6b5ed62bff1755"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.31.9/simpletunnel-darwin-amd64"
      sha256 "b713bcff3ae643e2f65846d9c39f5a6e1de718f752b1815ce2b2d183a145141a"
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
