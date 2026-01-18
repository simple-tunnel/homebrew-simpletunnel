class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.67.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.67.1/simpletunnel-darwin-arm64"
      sha256 "4bcb059f1c477d0bac2ced83fddf37819b720bc935b4d32ec3238c92593360a7"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.67.1/simpletunnel-darwin-amd64"
      sha256 "33b9a9090ba605e2780f0d0574c5b8986f2ef2abfd1e0c4db2a5b0453f62f1e5"
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
