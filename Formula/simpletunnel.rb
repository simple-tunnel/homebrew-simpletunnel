class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.69.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.69.0/simpletunnel-darwin-arm64"
      sha256 "4cadd9c642bd38df55726bace42fff046a58d4f5705e4084dbe5953e9fbd8ef7"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.69.0/simpletunnel-darwin-amd64"
      sha256 "4452abc75985999f7d0092ab8847596ac085b16487b11d5810feff6636ba871e"
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
