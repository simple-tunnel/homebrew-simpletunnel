class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.22.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.5/simpletunnel-darwin-arm64"
      sha256 "ac0ac19609ba1cbe1db781d620d092b5774020dc0333ae1ae1c9b3b35e86a6b9"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.5/simpletunnel-darwin-amd64"
      sha256 "315ac4b8e99b50208132f9bea38d43deb4b723913d0f580daadb32aea7625a38"
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
