class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.0/simpletunnel-darwin-arm64"
      sha256 "4ed6da84b83006d481422f40ade0146fb35b3e0c99a8828c6e8152e673eda68e"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.0/simpletunnel-darwin-amd64"
      sha256 "edf54aea475c94b7a4954a30cfecbdfd6c9ead0acae42fea22a041ae204c0264"
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
