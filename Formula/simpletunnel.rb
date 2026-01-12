class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.52.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.52.5/simpletunnel-darwin-arm64"
      sha256 "b114e6fafd2d98064265ce7e77f211bd8c8a81c6d31a7ce84919e0cfc2b2865b"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.52.5/simpletunnel-darwin-amd64"
      sha256 "56f428db3a5b2e4843594aab9244c50864bfd29f1c8434ef6dd0a09aa4342d40"
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
