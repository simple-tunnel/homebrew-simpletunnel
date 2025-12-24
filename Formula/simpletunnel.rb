class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.14.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.14.3/simpletunnel-darwin-arm64"
      sha256 "29fba2d18537aeb45fd3330f74e3f6ec33456a6d3902cd5e07c5f3ec8e050cc6"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.14.3/simpletunnel-darwin-amd64"
      sha256 "2a1f43d5caeb9ac92136b747aaeb6eb9567671652bb4f6d9dcca29bab0667553"
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
