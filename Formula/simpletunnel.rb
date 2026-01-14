class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.55.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.55.3/simpletunnel-darwin-arm64"
      sha256 "06617552f02ebccb15e906558456e6f41b24988a118c7da34fdefe5c244151b4"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.55.3/simpletunnel-darwin-amd64"
      sha256 "799335dbd0a2c7b8b2356f29772e53c085a5ecbd1553d1b82ca02508ce5901f7"
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
