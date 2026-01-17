class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.63.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.63.1/simpletunnel-darwin-arm64"
      sha256 "b0b7a39627f0abd414be185da7479b6ccbad74c56e28c558e798aa18ee559247"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.63.1/simpletunnel-darwin-amd64"
      sha256 "ee7c69967247d62e77fd3764714e6f3d313a36dba1233251c68fa12ec0fa7d46"
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
