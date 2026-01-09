class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.42.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.42.1/simpletunnel-darwin-arm64"
      sha256 "eb7fcfb89664396157d307aaaa4f6cb2a3360be264c02d9c655f0f49cd49d579"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.42.1/simpletunnel-darwin-amd64"
      sha256 "2c0b187d5b17446d307befcc4e53dbb53b6f4a215f42ebbbe7c0af56dc82aaeb"
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
