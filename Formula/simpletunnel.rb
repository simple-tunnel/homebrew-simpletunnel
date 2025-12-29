class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.21.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.21.6/simpletunnel-darwin-arm64"
      sha256 "9c477db8b772eb45628cf5e35f005dd5c94e908128b312ebc6c1523be030b1cf"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.21.6/simpletunnel-darwin-amd64"
      sha256 "a273c36e008c9ad6d2d564e7372e1308c2986b1b22d32b942d78ef40dd972d53"
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
