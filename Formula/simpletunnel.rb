class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.10.0/simpletunnel-darwin-arm64"
      sha256 "dbb8e516cae95d808964c0eac1ea3403b8cee8c27a39a561a8ed79971f836650"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.10.0/simpletunnel-darwin-amd64"
      sha256 "3e512babff1796822efc1ffb10f38ee886a5c8ae781257a96b2e5d8b9dce4596"
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
