class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.25.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.7/simpletunnel-darwin-arm64"
      sha256 "74ee796a75eccac2d8e9b519f0ff0efc880285f35f32d7656427ee44534ac7d7"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.7/simpletunnel-darwin-amd64"
      sha256 "42632e3ccbc0a98e9cb884af81477ab40749bf7f14a592f7a11190128bcea344"
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
