class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.22.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.8/simpletunnel-darwin-arm64"
      sha256 "c366d278c20b59992dfd2e10ae7334bf837d3d8ccb8909ea049ad7033acb3f5d"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.8/simpletunnel-darwin-amd64"
      sha256 "01268229754580453e6750626c303526a3391a052c823118b0b33e24f5c7ce8f"
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
