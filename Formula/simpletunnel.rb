class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.28.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.28.4/simpletunnel-darwin-arm64"
      sha256 "19313dbaeaf5bd8353099f2e5ec0df9d7027e2b0a1f16b04c3aab5299fc1082c"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.28.4/simpletunnel-darwin-amd64"
      sha256 "1af022bfdac5fa227a0db51f579cc0a4930883eb32cc250b58b95bf598383ad5"
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
