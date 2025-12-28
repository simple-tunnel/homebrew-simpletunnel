class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.19.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.19.1/simpletunnel-darwin-arm64"
      sha256 "b287f53e8a605c1f6c974c104cb129d42ba8837a18ae56594eb76eda49602897"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.19.1/simpletunnel-darwin-amd64"
      sha256 "9af0963a6852637cec51b19a3cfbc66627530a8a8f080970dba5b7d3574a566f"
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
