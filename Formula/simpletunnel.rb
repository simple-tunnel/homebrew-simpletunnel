class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.35.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.35.0/simpletunnel-darwin-arm64"
      sha256 "cb6b0cbd1d9aabe24cdc5ba0972cb047afa621938aed6bab3b0ae40b6da903c6"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.35.0/simpletunnel-darwin-amd64"
      sha256 "03c3d0ad678e05606492200eeeb7cfd932a87736a2a110cf9ab535ea03a7c6a2"
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
