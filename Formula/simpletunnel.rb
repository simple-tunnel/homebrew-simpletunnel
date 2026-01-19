class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.68.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.68.0/simpletunnel-darwin-arm64"
      sha256 "daad596f36e42bbe84f2740e7e264c73471a58ad4423b9c516153b4a97da231e"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.68.0/simpletunnel-darwin-amd64"
      sha256 "a84b6f1885a6da43fdc62217cfa17c8099d9a2ae96581fcb582dd81ccc5a14f9"
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
