class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.67.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.67.0/simpletunnel-darwin-arm64"
      sha256 "a553cfb2966f7e39c2d572520b37789acf0a7343ce7891f7c34691c6cc826233"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.67.0/simpletunnel-darwin-amd64"
      sha256 "4f34c4ed5bc1a4b7e743f52f628c7e70d65bd6decf309adc16f775da3e9aa2d9"
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
