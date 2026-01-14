class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.54.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.54.1/simpletunnel-darwin-arm64"
      sha256 "4f8ae17081427ef3880416f224c58b55811cbb5e43ca84211bbebfdab144d6ee"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.54.1/simpletunnel-darwin-amd64"
      sha256 "1e5930224ef2ea80922261552354f60f49a48f08ccfca030ceb0f00519b8f409"
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
