class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.64.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.12/simpletunnel-darwin-arm64"
      sha256 "1a7b3a17238a16821a08db7f36a2c485a5e20574d0fd3f6844c1b4e3c20cc42a"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.12/simpletunnel-darwin-amd64"
      sha256 "4b9afcc3dbb2bc877bb8f56273ece22e904d20b7c8715950f405f1a17303701a"
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
