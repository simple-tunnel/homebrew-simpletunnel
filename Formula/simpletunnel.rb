class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.15.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.3/simpletunnel-darwin-arm64"
      sha256 "5a045732dae27525db555b57232d08dd2194abe08dc395f63e7e50ea75cd8abb"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.3/simpletunnel-darwin-amd64"
      sha256 "00a11f01f3798bf6ce4d7ef100d7c25d0a40ef729e6f2b102e00417b5442196b"
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
