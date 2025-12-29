class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.22.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.9/simpletunnel-darwin-arm64"
      sha256 "37fefd8d2820b85ec59f3e0453f0d3e5c7b0d6de725da05d3e6fca108cdf242d"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.9/simpletunnel-darwin-amd64"
      sha256 "1e4fb3442b03df4e6bed5f9f286515f1ef000020256dce1315b95afd4cd443ea"
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
