class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.22.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.14/simpletunnel-darwin-arm64"
      sha256 "d41f0d0cbdbde761b9c567f3c1ecd95d26bf556e629571455a2f036c53f8f9af"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.14/simpletunnel-darwin-amd64"
      sha256 "39f8e072934e99addf745dfbfd6312edac1fcab2060ccd809e520c48e4504502"
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
