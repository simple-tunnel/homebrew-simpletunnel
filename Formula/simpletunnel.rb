class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.16.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.16.2/simpletunnel-darwin-arm64"
      sha256 "b1cb15984db3ef493086feb2e8133d9c8d4173f6b666e2e6072500e80c1ec81e"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.16.2/simpletunnel-darwin-amd64"
      sha256 "f6e265bc1e3815301f21b6742237ef62ff0e139156f676ea11f62b2bdcdeeb28"
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
