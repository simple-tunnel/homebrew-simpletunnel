class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.22.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.6/simpletunnel-darwin-arm64"
      sha256 "be01f5082ab218ced13f2f5366de94f272eba19097fd7324934eb5c4455e7942"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.6/simpletunnel-darwin-amd64"
      sha256 "511ecb5859284c924578eb666b61ac909192ba1fd6ca40943dd037b852bdc894"
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
