class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.75.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.75.0/simpletunnel-darwin-arm64"
      sha256 "8484631990497aacd7983e84098110e57dc787a90699ddac1186bcb5f59a20ee"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.75.0/simpletunnel-darwin-amd64"
      sha256 "21284c0937371cb411bf3b141db3c734983dcf9bd93847cc7b4fdc08748c24c0"
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
