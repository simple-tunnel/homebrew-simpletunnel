class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.64.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.2/simpletunnel-darwin-arm64"
      sha256 "e01f2603d1062a496d41a0e1426b4e0e7b88bd2f7a0a1605d4861b94ea141143"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.2/simpletunnel-darwin-amd64"
      sha256 "f5fb3b342e6441ef5aea28f5b980d69ef437bb7a707790013b811dff42ea2c02"
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
