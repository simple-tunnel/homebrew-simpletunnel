class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.18.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.10/simpletunnel-darwin-arm64"
      sha256 "f68ebc1f740936df94de16a000a03859bfa3302abb3a8159d5b3f82d38292a7b"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.10/simpletunnel-darwin-amd64"
      sha256 "7f33ff7f99d750205b3f9e3e7cd159436385c8394a702db8b4118306a49f9961"
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
