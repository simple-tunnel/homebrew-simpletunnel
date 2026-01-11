class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.50.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.50.3/simpletunnel-darwin-arm64"
      sha256 "14d47c9d2986e5e6aad3bcccd980bbde6f8bd6cfed9c3923b762dfa72c4551b3"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.50.3/simpletunnel-darwin-amd64"
      sha256 "13bb6441413384ceded711bfd4aeb6041f257c78ac01cb8672cad2ae8dbbe965"
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
