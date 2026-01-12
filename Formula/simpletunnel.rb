class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.53.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.53.2/simpletunnel-darwin-arm64"
      sha256 "6f8dfd4098d8fc7a04b46f6a590c851b67a90f6762716aacb745c0922c472b8a"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.53.2/simpletunnel-darwin-amd64"
      sha256 "2032ca1fe4fbfed88ce9dd80c6c473e665acd70aa5166f4396b3c6adb5e084f3"
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
