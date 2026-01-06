class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.34.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.34.8/simpletunnel-darwin-arm64"
      sha256 "6a04c09d95e0cab4df4ed28a84c728717c10f9133729c7cab318a8bee70e42b4"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.34.8/simpletunnel-darwin-amd64"
      sha256 "a5922b837d7f1b6838272f94e26d2d579269af4eb8923f69d163276c9f4fc850"
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
