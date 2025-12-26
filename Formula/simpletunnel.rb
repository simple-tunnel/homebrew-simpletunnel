class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.17.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.7/simpletunnel-darwin-arm64"
      sha256 "4ba2abba8da17be48ecefa43953cc5cfa410311ff76463acf980e4085bd9875a"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.7/simpletunnel-darwin-amd64"
      sha256 "14be1f40a023eb812583899756bb7b22958c0de8cd8aa84696adf9206c6564ba"
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
