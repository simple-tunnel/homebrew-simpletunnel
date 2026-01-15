class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.58.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.58.0/simpletunnel-darwin-arm64"
      sha256 "a3d8eccf175bc0ea38f353fa6f1b821c2abb05fc1a87f1c00c6f327b4fd6ff35"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.58.0/simpletunnel-darwin-amd64"
      sha256 "a2cc3168345e2cbd3d6399a711c2e3be8119d4e8c952e6a9334d43edd3916e08"
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
