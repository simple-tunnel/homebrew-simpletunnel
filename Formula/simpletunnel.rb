class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.53.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.53.3/simpletunnel-darwin-arm64"
      sha256 "9563583ceabb102204896fe991b6cf1fcbbbb6343dc049b206b7a0a8b83b7e52"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.53.3/simpletunnel-darwin-amd64"
      sha256 "dd77293619a1277e02938bc3fab27174c2ba90fe020aa2f2e1ca9b32dae628a2"
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
