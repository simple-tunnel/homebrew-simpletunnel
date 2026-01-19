class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.72.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.72.0/simpletunnel-darwin-arm64"
      sha256 "1eb6b86293f98627d0e74984a833b755991433c6d9edeb32a5e799850280ed3c"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.72.0/simpletunnel-darwin-amd64"
      sha256 "0cdf9640ebc741cf3b4e24a4e33ff3f115e779ef882703b20a62e3bb81e72423"
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
