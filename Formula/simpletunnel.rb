class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.22.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.10/simpletunnel-darwin-arm64"
      sha256 "6aa19e9f7a84bc319054d52cbbf11639310efe93830c6390bd6e2e75747bd95b"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.10/simpletunnel-darwin-amd64"
      sha256 "c1841c69d341c589fd18aaff1ead21149a60008ab34d981a17f667f95e71a80e"
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
