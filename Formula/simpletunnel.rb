class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.61.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.61.1/simpletunnel-darwin-arm64"
      sha256 "37a206719b58adc730a7ad1db312bb8342e9068c25daa9eb4b949d1012c5d9b6"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.61.1/simpletunnel-darwin-amd64"
      sha256 "06b49c3ace14fae3eb5620f077c63062c58ca6fbbfc988ffcb75b7637569eb2d"
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
