class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.18.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.9/simpletunnel-darwin-arm64"
      sha256 "000c845160727f53303dfbcca5995fdab135d4dd59b876202adde0db61f48544"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.9/simpletunnel-darwin-amd64"
      sha256 "b3d1306bce0eae40eaf8ffd0eb2abaacce2c299c0d85280ff4ae1fdd070c309a"
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
