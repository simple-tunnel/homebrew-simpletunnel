class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.31.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.31.8/simpletunnel-darwin-arm64"
      sha256 "963ad059fd2602fdffe1a66a9b6f31feccb083e538e9be618d03226c03a75678"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.31.8/simpletunnel-darwin-amd64"
      sha256 "b51936054ea3a52302b5ac0bb08251ee85014f623809554073325c2ad7919455"
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
