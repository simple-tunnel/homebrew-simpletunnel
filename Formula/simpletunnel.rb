class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.15.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.2/simpletunnel-darwin-arm64"
      sha256 "79508c100389f956ea7ca3feaacee43c2d07bb0da6615b4447fc9afa119f0601"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.2/simpletunnel-darwin-amd64"
      sha256 "965b53142f265637e52cf0c7e81d1308e5dc14d2dc3ba5264cca687a5e75775d"
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
