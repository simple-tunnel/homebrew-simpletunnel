class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.31.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.31.7/simpletunnel-darwin-arm64"
      sha256 "9205b8df71bb8b454e199fa987c99ac58ee1827d83b9cecd4d89ce34fef8f5a1"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.31.7/simpletunnel-darwin-amd64"
      sha256 "e85a8fb429e8c76d17c601004e6ac577ca702d5677b2dec936bd19430142d02c"
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
