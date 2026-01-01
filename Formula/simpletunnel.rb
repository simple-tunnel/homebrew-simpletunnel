class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.19.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.19.3/simpletunnel-darwin-arm64"
      sha256 "20a55651037897f6c464dbb47de0240ea6d328e1bd15413abf6c585c076ccce3"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.19.3/simpletunnel-darwin-amd64"
      sha256 "b8938b4e351b0c61ef6b0d43f264386ec294f978009d74a4996de0e1f2d2e00a"
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
