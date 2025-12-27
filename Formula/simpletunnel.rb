class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.18.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.3/simpletunnel-darwin-arm64"
      sha256 "2a0c79d08db636d3a792699f9d42a4f486ef6c426db160d862972fc8616ac4ed"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.3/simpletunnel-darwin-amd64"
      sha256 "510b9ca55baec752c07ccf8f6b6ddcf1844d623979b33613483b7755ec8b2994"
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
