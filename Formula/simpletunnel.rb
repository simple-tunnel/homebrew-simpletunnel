class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.76.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.76.0/simpletunnel-darwin-arm64"
      sha256 "1873099e963ae3304c25cbccdad47471dc35e093de860be093f547bb0ad56f00"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.76.0/simpletunnel-darwin-amd64"
      sha256 "59d334f063a864594b9b59478cdd140ab204b33fc358eb881f39cbbfb395766d"
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
