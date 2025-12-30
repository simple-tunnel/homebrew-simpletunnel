class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.2.0/simpletunnel-darwin-arm64"
      sha256 "ef3bd9e1758d36b0bcabf4d68e9198579c51c037128de625a349a94ae93eb0d5"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.2.0/simpletunnel-darwin-amd64"
      sha256 "24a426220d872e4acefb3245fe59e9ea6b4048821d4236118d7f78a3f2e43839"
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
