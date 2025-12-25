class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.15.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.7/simpletunnel-darwin-arm64"
      sha256 "456092fb6fa305808e031a9d587214cc8d0d6f3c8967fee7b636c78ee603a379"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.7/simpletunnel-darwin-amd64"
      sha256 "fc11dc7cbd5c96e88e1490f28ad9e732be531843df0b5bc89fa69e988d64fde1"
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
