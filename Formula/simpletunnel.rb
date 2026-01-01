class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.21.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.21.2/simpletunnel-darwin-arm64"
      sha256 "f19d8965af50a50cd1071dff2a25ce2b323d3da56c6bff323b46dc85d8d7392e"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.21.2/simpletunnel-darwin-amd64"
      sha256 "0805e1484e2496a4c1051c9704d3fc21978f2cb295dd1641d17f63b28a4e676a"
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
