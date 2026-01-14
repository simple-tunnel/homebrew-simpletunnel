class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.55.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.55.9/simpletunnel-darwin-arm64"
      sha256 "58b6bfaad502a372b3bd2ce50e7c99dc74a5a9aa3bf2998576be9840de55c3a1"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.55.9/simpletunnel-darwin-amd64"
      sha256 "7e38e9d396b63988002050426f27d6a5f854d62292056cd560b38d522458072a"
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
