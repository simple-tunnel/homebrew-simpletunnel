class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.18.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.6/simpletunnel-darwin-arm64"
      sha256 "8c77dbf46a1d78bdc642f611c378b3f48b59fd057bae9ed3589bcd22fe33d3c5"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.6/simpletunnel-darwin-amd64"
      sha256 "c3062ceb9b0ed01328c9db5bd5a1e9ee93c23495d2d007972d972bbd68c38fc4"
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
