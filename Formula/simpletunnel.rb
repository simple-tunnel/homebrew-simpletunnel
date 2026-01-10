class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.47.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.47.3/simpletunnel-darwin-arm64"
      sha256 "94e46004cc9602a511830c77ae43dd740c0b8c8511ed85da7cab3052ea9d23ee"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.47.3/simpletunnel-darwin-amd64"
      sha256 "e10635e24b219f7f18f41f588f9df686cde1082cb254b978ebc0c71e57890926"
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
