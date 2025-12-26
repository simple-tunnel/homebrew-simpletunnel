class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.16.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.16.3/simpletunnel-darwin-arm64"
      sha256 "49afa6da45de05348c638b888e42166450b9397d64de8d98598fe57e63475c1f"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.16.3/simpletunnel-darwin-amd64"
      sha256 "9f024605af834461c91b19362c735b3c5c87a30718410dff1fab1e59d7f35113"
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
