class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.2.55"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.2.55/simpletunnel-darwin-arm64"
      sha256 "0225e28f47262b1f3f7331c59b79ef48bc02565332805ca3b2254058b6e6df34"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.2.55/simpletunnel-darwin-amd64"
      sha256 "303343cabfc1a64dbc4d1edf4553a085506ca3c1b6bb52f0d87bbbbff4d46399"
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
