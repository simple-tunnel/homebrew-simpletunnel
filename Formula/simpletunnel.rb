class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.20.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.20.1/simpletunnel-darwin-arm64"
      sha256 "9e9dc1dbdac2f08cdaa7d159172bd6499db8301908d5142f1b8feb27d56ad279"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.20.1/simpletunnel-darwin-amd64"
      sha256 "8cf75eb5f7f320dc542518bb292bba08149788d92f804d2204a5bad0c4385678"
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
