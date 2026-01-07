class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.36.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.36.1/simpletunnel-darwin-arm64"
      sha256 "fb3e36b59d7dee406ad2af5b2ecc7ec6870e5acf3fe09489ecb399aba7d7e01d"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.36.1/simpletunnel-darwin-amd64"
      sha256 "b20d5068a74c55762437614437f408131edb8570bcaca980ccbc897fcc4c7988"
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
