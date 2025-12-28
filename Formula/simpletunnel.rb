class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.21.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.21.2/simpletunnel-darwin-arm64"
      sha256 "ca1cd0bafd02880000290a8c35821010d11695c67d10ad892a7a093c9b555a8f"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.21.2/simpletunnel-darwin-amd64"
      sha256 "08ff371bbae488e623ab272ff503c0c71f34f052e0d01ebf38f992e1deadb3a1"
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
