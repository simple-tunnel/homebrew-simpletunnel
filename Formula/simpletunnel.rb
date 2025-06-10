class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "1.6.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v1.6.16/simpletunnel-darwin-arm64"
      sha256 "76c3a214893e3862d97494d7e8d81c90c65fa4334c2ed0a785abb071e48453d0"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v1.6.16/simpletunnel-darwin-amd64"
      sha256 "76c3a214893e3862d97494d7e8d81c90c65fa4334c2ed0a785abb071e48453d0"
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
    assert_match "SimpleTunnel", shell_output("#{bin}/simpletunnel --help 2>&1", 0)
  end
end
