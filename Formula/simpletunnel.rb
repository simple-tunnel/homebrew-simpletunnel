class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.49.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.49.0/simpletunnel-darwin-arm64"
      sha256 "489a716be5f3a027b8fcc92667ee15f665ea340678e55a2258f073cf28c21389"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.49.0/simpletunnel-darwin-amd64"
      sha256 "d27cc3c3566e3686bc47a43aadc5bd18597b0a398167b8c9f3c9d4d72b83dfda"
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
