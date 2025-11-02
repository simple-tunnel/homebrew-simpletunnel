class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.2.69"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.2.69/simpletunnel-darwin-arm64"
      sha256 "4d876fb241292911ce34e173d13adf6a1cf912113fd9f42611000b8ff51ed860"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.2.69/simpletunnel-darwin-amd64"
      sha256 "efe53ea7a96503ac11528e711422d5c63a6dde0b4cdcaf4c834758d1033e48ef"
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
