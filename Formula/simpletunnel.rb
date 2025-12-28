class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.18.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.15/simpletunnel-darwin-arm64"
      sha256 "db804398c5db401b377d261c0c707d91f9633418e0ee20fc684dc90f599059f1"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.15/simpletunnel-darwin-amd64"
      sha256 "5d4957376c361785b4feea1bb2273ff33273351f77467c98750daf31a7edfec3"
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
