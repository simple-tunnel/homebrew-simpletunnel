class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.15.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.5/simpletunnel-darwin-arm64"
      sha256 "2141f2d18c94be39ce5840a76df5ce81b361d6daf671becbd5ab1999449f5c91"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.5/simpletunnel-darwin-amd64"
      sha256 "4c77f430b6f11df04eef4f73185b1f4ebafb3f075bbb4be22f21c368a1ccc9e5"
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
