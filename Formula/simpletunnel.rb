class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.64.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.4/simpletunnel-darwin-arm64"
      sha256 "ea4e6e7b887dd20d240da44d881aee386c90351b851a63527a97bc0ffd5cd6bd"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.4/simpletunnel-darwin-amd64"
      sha256 "5c027345c634cd28fc643a5f69d6d2e922bb028d04357d8def14e9c018adc94d"
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
