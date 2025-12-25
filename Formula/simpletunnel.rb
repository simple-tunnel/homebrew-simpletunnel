class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.15.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.13/simpletunnel-darwin-arm64"
      sha256 "4e3237796d16b65dc24b46c23874e80c52fc9c030d1eba779ec42a88563665a3"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.13/simpletunnel-darwin-amd64"
      sha256 "4719a6af6c733baa5b151395a54153ee24e8fce7ad23ca7753e413cb0cf8047d"
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
