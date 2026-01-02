class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.26.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.26.0/simpletunnel-darwin-arm64"
      sha256 "adb5056c54f78fc344076809aa89aa5030cc76d094d600244785dc32af1d8621"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.26.0/simpletunnel-darwin-amd64"
      sha256 "1b925e50d9a31dff8cfeec0fb497397ccdef7fa3b4b47ef368e253a2b8e91ad7"
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
