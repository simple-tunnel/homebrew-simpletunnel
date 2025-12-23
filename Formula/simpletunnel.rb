class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.5.1/simpletunnel-darwin-arm64"
      sha256 "0f119f402f5ebfe410466be84b51414addd1fc3f83d144081697ed720c79931a"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.5.1/simpletunnel-darwin-amd64"
      sha256 "e55e600926b88b9eb0317725aa04b4d85462db34c6559b25ed341a15a3b4c162"
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
