class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.21.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.21.0/simpletunnel-darwin-arm64"
      sha256 "bd129e5990cdccc483acce4eb7520ef5bd56a9fec83342540c77a557dfd17755"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.21.0/simpletunnel-darwin-amd64"
      sha256 "1641052d315a1635e190bc6f9266548832da85f4969e1c125a46bd3bd8f326c6"
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
