class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.21.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.21.1/simpletunnel-darwin-arm64"
      sha256 "9e73ede2316da96d8f736f2a1bec6cc1a699656846d81c814b6abba59c4e1b63"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.21.1/simpletunnel-darwin-amd64"
      sha256 "5dd281d666106e116169635a16de08b663bd55923e3bdd5339c72528754ee339"
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
