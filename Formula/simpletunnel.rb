class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.47.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.47.4/simpletunnel-darwin-arm64"
      sha256 "488127fe3bf06750e8ce80ca40430369118ab89977e1adad8f19bcbbcfecab1b"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.47.4/simpletunnel-darwin-amd64"
      sha256 "bbb8ed0a1a2ffc47ad000ebc6684e060ec099c18b1d27b03eac9adf06b008ecf"
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
