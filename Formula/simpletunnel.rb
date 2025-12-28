class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.18.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.16/simpletunnel-darwin-arm64"
      sha256 "ae206f7b026c0c1daaea87d8405805a1c3cac7b2f01f430a54473dfe5c045beb"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.16/simpletunnel-darwin-amd64"
      sha256 "b59154872497f93f6cb7255e5ffa1190ca17e8dfc89c3db0da834d6d97e6a433"
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
