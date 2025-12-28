class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.18.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.14/simpletunnel-darwin-arm64"
      sha256 "296cf06c1acbdebbfad93718f15462691260e4b0e2fb71ac3582e271cc84fc39"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.14/simpletunnel-darwin-amd64"
      sha256 "d1f3e3a036cdf6b9ef77c1a30d024fa69d44f995e3520e9502f45141e9b1125b"
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
