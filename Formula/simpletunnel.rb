class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.31.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.31.4/simpletunnel-darwin-arm64"
      sha256 "c1a1590299701f48e4997179351ea9548d62351903caa3dbb69339577496c13b"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.31.4/simpletunnel-darwin-amd64"
      sha256 "0437eba1b313748842fa241d3b2008dadd96a40a50c70edbca80a799661e3cbd"
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
