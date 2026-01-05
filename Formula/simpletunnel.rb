class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.34.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.34.7/simpletunnel-darwin-arm64"
      sha256 "8800b4f3c694c04e5bc16cac22fddaec530d85c8f1d793050eac2e1fcce10099"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.34.7/simpletunnel-darwin-amd64"
      sha256 "db54e74d6c37a24ec29a2506ba1dd833d624a775a067f4d1f969e4823a86b7a5"
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
