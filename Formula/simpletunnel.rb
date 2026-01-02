class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.24.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.24.1/simpletunnel-darwin-arm64"
      sha256 "828871e9142335d83de347c13c50c11cc94cb9baec0a4c632775f1b5d403c0d5"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.24.1/simpletunnel-darwin-amd64"
      sha256 "2d22e25c8520059f75872a1d829b3fd66c3a57a3f1059c1ab33100e05707f8f9"
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
