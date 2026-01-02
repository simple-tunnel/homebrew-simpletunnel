class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.24.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.24.2/simpletunnel-darwin-arm64"
      sha256 "e87511227b234deddb42219d9055d695f3a6193a6f87155f273f2728aecd4f39"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.24.2/simpletunnel-darwin-amd64"
      sha256 "527242881258c3dc562c7aae612eb8d86b3e1dca781b54d46384a2c510e4c04d"
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
