class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.55.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.55.8/simpletunnel-darwin-arm64"
      sha256 "376134339c26875afa1245d9a4c6c3173c6f0de42dae64badb1bfe87c91a812b"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.55.8/simpletunnel-darwin-amd64"
      sha256 "0f97886fc15ecdb6af834b1c1673cfb5e47d005b93831d945ea4cf9fb731b3ae"
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
