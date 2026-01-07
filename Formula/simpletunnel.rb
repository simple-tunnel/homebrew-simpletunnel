class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.38.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.38.0/simpletunnel-darwin-arm64"
      sha256 "52651e7ec47749f76c26d39bda2086a88959b5776b37df450dfe4e34ec664545"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.38.0/simpletunnel-darwin-amd64"
      sha256 "95aa837a302725bfdb3d449b790c7a800184dadf97c64123cb64dde5c1d65d4b"
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
