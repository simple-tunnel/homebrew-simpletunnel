class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.39.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.39.2/simpletunnel-darwin-arm64"
      sha256 "323bf0acc1af74ba4cd66f909abdb7ce7b1432957468626a172876b4ac3825dd"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.39.2/simpletunnel-darwin-amd64"
      sha256 "5025f64665ca138877018ab542a6388ade02a4a2f62d5fe0e08964e8c134d260"
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
