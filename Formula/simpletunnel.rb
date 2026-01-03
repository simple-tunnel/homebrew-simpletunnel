class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.28.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.28.5/simpletunnel-darwin-arm64"
      sha256 "f71b5c3ffad558f33696ba92e600d505f62a1d47551ceb7a0580515eb90bc90f"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.28.5/simpletunnel-darwin-amd64"
      sha256 "4e0022c047d396764c2258f720181528d880f151b7ee79f8705766ecc454dd8e"
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
