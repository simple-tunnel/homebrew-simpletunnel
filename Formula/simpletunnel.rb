class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.14.0/simpletunnel-darwin-arm64"
      sha256 "511053746c1726270e7623f6841f14c35c05974084746da759e3226574291278"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.14.0/simpletunnel-darwin-amd64"
      sha256 "d299c2adc1d381d9e4b38787b3a3554ef20c05982b5420b7261c2ddc96ec73eb"
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
