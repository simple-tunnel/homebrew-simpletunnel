class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.78.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.78.0/simpletunnel-darwin-arm64"
      sha256 "34159e897d4ca489cdf007d7bcde064b4375d8ea849ccd767e69e4d977d678e3"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.78.0/simpletunnel-darwin-amd64"
      sha256 "6acdd0d75435a58d7a0de433b272d325d954a577468a85d90c1d73971361e7f6"
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
