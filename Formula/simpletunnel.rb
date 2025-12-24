class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.7.0/simpletunnel-darwin-arm64"
      sha256 "b872d2909282f5acd18366cc51fe426591c119266b118b38566415867b6f6058"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.7.0/simpletunnel-darwin-amd64"
      sha256 "02a5f3a4326c15ec4b313c3d18ec8eda42f2eaa64b8499b8673952febaab4889"
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
