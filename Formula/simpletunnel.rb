class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.25.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.2/simpletunnel-darwin-arm64"
      sha256 "446d0ab56124eb9de1de9f961616474d1dae57b6cdb8fb8882b31e4e01434c32"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.2/simpletunnel-darwin-amd64"
      sha256 "95b3333d9737b22171b743cf7e2bc4d0451f5bccee5f08c6f20b27029cbdabc8"
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
