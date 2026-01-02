class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.25.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.1/simpletunnel-darwin-arm64"
      sha256 "4466c18cfcc9cff9525382bf8f5e4535402c963eddc5b4b4b5a294ffeba45acf"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.1/simpletunnel-darwin-amd64"
      sha256 "89bc906a6601aecde14cf776d9930c7664fca189a750ac5c14ee75f06802c16e"
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
