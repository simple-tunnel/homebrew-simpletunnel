class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.31.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.31.5/simpletunnel-darwin-arm64"
      sha256 "86e74eb27c0d665347c4e4737ee1b5104bef9e4282d4e628e94e98a9dc48bd23"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.31.5/simpletunnel-darwin-amd64"
      sha256 "31ac1f7008fb10d04d3671d502d4b5337829c8752af80f94c6549b97b50b6b74"
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
