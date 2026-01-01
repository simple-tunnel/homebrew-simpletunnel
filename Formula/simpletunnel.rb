class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.19.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.19.0/simpletunnel-darwin-arm64"
      sha256 "3bd39c7608caa3abd50a81bfbe222231a3e9d68ccc84302c0fcb8d185ec3062c"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.19.0/simpletunnel-darwin-amd64"
      sha256 "4db118cf8695010eca29c91fc77c56f0475f469d36d1d7ee68529577ed051efa"
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
