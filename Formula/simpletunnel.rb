class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.80.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.80.1/simpletunnel-darwin-arm64"
      sha256 "d8a48142dbb1e314aa3179fcfb8700b3e76e6ea5e2e3065ac85d7b62ccddcded"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.80.1/simpletunnel-darwin-amd64"
      sha256 "e4678555537fea8038423c8a0fc2652e1328f33a8caee5f98020c79a124c0852"
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
