class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.69.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.69.4/simpletunnel-darwin-arm64"
      sha256 "2fc2f960d8dce62f12fb825cf2a9b54bbfe750170ff7ae939ac2b326852fa2bd"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.69.4/simpletunnel-darwin-amd64"
      sha256 "b63a773e5cc0fb66b3c7aeebd62d72eaa0f24665c01fc4f843204f435af9e028"
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
