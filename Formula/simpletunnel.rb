class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.28.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.28.1/simpletunnel-darwin-arm64"
      sha256 "5f8fe67f2ccb710c18d32f779aa44169a23455cc7215babea53784f31aef7d0e"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.28.1/simpletunnel-darwin-amd64"
      sha256 "8e9a1bad7e45ef21a1afd5fb77454581ddfcb63bbf3e36d165e90b472ebc6433"
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
