class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.17.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.10/simpletunnel-darwin-arm64"
      sha256 "30a12ad237b1670dac1a1715254f1b6157e6c2e1656c70db0409a2a4f7402869"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.10/simpletunnel-darwin-amd64"
      sha256 "57977e97c8c5e698b772e7423693b1fcdc0b5704bff77d9e074d69bbe4c60d53"
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
