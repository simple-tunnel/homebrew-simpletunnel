class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.46.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.46.0/simpletunnel-darwin-arm64"
      sha256 "e141cc51c82cb743ef7b63c4f424834f3427a0dd7f7ca43c913313574c2d9b5b"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.46.0/simpletunnel-darwin-amd64"
      sha256 "76463a918736b56679529dc2aa585106710224fa88cc407713e9df645abac88f"
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
