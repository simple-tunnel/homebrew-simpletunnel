class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.18.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.5/simpletunnel-darwin-arm64"
      sha256 "4b27c3e3bf5878b65f6471f94ff1f4224246cd59a33be30fdcebc58f9eaa8439"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.5/simpletunnel-darwin-amd64"
      sha256 "e04b59f646ff7780389b0aa7797a47b7bed104eadf62cdf8a6101209e2c614ba"
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
