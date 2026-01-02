class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.25.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.6/simpletunnel-darwin-arm64"
      sha256 "b3385f038fd221fd002826adc137ae87564471ee9a675b278c1198e6bfdae036"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.6/simpletunnel-darwin-amd64"
      sha256 "cfbeacf6d56aa975e2d8c2c35183ce10e1aa0c2bf6aa18f88ca10a5f59cf165e"
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
