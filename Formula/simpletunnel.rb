class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.31.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.31.1/simpletunnel-darwin-arm64"
      sha256 "7249b33970d65a4fdf3d90aa13cf577af7e27cbbf6b635f5c61b4e638d44bad8"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.31.1/simpletunnel-darwin-amd64"
      sha256 "29e4866cde7a04c5350037cc5c1f3520f7ed3a5e6e33c425f1a5a181bb5c6cdf"
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
