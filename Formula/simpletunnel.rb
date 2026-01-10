class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.44.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.44.0/simpletunnel-darwin-arm64"
      sha256 "ba677381dca7e13c89ecd63cac08297af8df645bcb6fe2f4dbfe41e34616d9fb"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.44.0/simpletunnel-darwin-amd64"
      sha256 "38524f9b86d7958c094c6a1b1a1ad56accf173df8d819063e828ed093c4b0bda"
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
