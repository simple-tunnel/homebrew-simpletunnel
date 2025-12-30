class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.6.0/simpletunnel-darwin-arm64"
      sha256 "61e089c98a171bb88bf2eccd09053b8591a2f7674d82ab80668e257ec202eb17"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.6.0/simpletunnel-darwin-amd64"
      sha256 "1a14df2df65faf8a55c9e997f3ce05a7023576d9d7477d74729754765bfa7a0d"
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
