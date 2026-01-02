class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.25.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.16/simpletunnel-darwin-arm64"
      sha256 "c6944b226ff57b428965bdb5de4e2b71e65c6a8eed3413e6c6f9b06b0f7064ea"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.16/simpletunnel-darwin-amd64"
      sha256 "323b8c8430c23178a5401051cd97c68bd20eed2d4f6f9618ba44b3be2131e0e5"
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
