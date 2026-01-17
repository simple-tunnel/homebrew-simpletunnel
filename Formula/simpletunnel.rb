class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.64.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.13/simpletunnel-darwin-arm64"
      sha256 "09754ecda38307164626cfea4b078ad8cef0789122fb64e163d18beaec436694"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.13/simpletunnel-darwin-amd64"
      sha256 "facc216a1552c2b00de6700e6d72646e9cf26e8859292d0724dc4f399045e6d9"
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
