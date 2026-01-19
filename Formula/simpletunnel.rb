class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.69.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.69.1/simpletunnel-darwin-arm64"
      sha256 "9d32799a18a82882886303959d58d0bd5c72e41a96af5c4f625e432edca6961f"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.69.1/simpletunnel-darwin-amd64"
      sha256 "dd0ad4e4561b272156b1a95bb09cc3ab1d85d149f9018aabb2bb3ea7b00605a5"
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
