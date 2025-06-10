class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "1.6.36"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v1.6.36/simpletunnel-darwin-arm64"
      sha256 "cb571ade74e0b0b8fe07280808dace4c030f565c3bbc01174e4f3444643cd7ff"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v1.6.36/simpletunnel-darwin-amd64"
      sha256 "cb571ade74e0b0b8fe07280808dace4c030f565c3bbc01174e4f3444643cd7ff"
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
