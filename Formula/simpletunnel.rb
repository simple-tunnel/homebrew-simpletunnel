class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.60.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.60.0/simpletunnel-darwin-arm64"
      sha256 "8266dc64020e4be9ff22c09fe2cb2a048cc198592fed0393528be06e055281a0"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.60.0/simpletunnel-darwin-amd64"
      sha256 "9f13aa924f29daa4bfb4b598fb527d85cd3b85fde4ab3e6d7afc689a700e4cbe"
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
