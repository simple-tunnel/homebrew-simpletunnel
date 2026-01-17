class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.64.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.6/simpletunnel-darwin-arm64"
      sha256 "19d8fe908c9a8b39fe030ad13db57a533b822887edecce0a3d4f7910dae3a77a"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.6/simpletunnel-darwin-amd64"
      sha256 "d02b98c474aa2668bc0427cb26e45e10093e1d418672d4568859ce26bdb6e30f"
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
