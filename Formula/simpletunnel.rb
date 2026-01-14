class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.55.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.55.4/simpletunnel-darwin-arm64"
      sha256 "37d1cc451b1e731b10fdd2684235ed568c956ef66f079297af5587382d062fc7"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.55.4/simpletunnel-darwin-amd64"
      sha256 "92163939de3aaec4fc1ecf79b6a72fb66cb44d50da1e8279c08deaf1870150c4"
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
