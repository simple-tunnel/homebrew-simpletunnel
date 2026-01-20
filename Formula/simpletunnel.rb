class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "3.82.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.82.0/simpletunnel-darwin-arm64"
      sha256 "5021cd11edae36339b1ef9067e67e49146cf35b33747c6d23442ce0eb269d427"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.82.0/simpletunnel-darwin-amd64"
      sha256 "2ddb8cd374e720a57f472e5b2fb9fe0417db3d063c9068404e66f693dff2f34f"
    end
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  def caveats
    <<~EOS
      SimpleTunnel requires an API key to function.

      1. Get your API key from https://stunl.com
      2. Use SimpleTunnel:
         simpletunnel -port 3000 -key YOUR_API_KEY

      For more information, visit https://docs.stunl.com
    EOS
  end

  test do
    assert_match "SimpleTunnel", shell_output("#{bin}/simpletunnel -h 2>&1", 1)
  end
end
