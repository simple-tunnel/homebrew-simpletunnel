class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.48.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.48.0/simpletunnel-darwin-arm64"
      sha256 "7d9d2dec91acae59b08c154c1cee245d67622f4292b774e66d7681adf65aea96"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.48.0/simpletunnel-darwin-amd64"
      sha256 "fa95b87a0c7884a45c0389d87b9cde71927c4597108a4d45a52782445b3221b4"
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
