class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.22.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.3/simpletunnel-darwin-arm64"
      sha256 "ebfd1fcfd90025d2da7c83607e073faabca77cdd329b35d7927dd98e5ad82c4e"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.3/simpletunnel-darwin-amd64"
      sha256 "6b26d340eaf1ecc9a8fbe8d5169586ac351567a822c0df6c4c1fffb4ed659fd6"
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
