class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.8.0/simpletunnel-darwin-arm64"
      sha256 "3ddafd2b35cc502db7f66f5b953da7365187fe838b230d6ece89dd200cfa64e1"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.8.0/simpletunnel-darwin-amd64"
      sha256 "08ea8dc62ef904d53cc163a0999f25e4574e9f79ee7930729561437d253b28e1"
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
