class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.52.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.52.2/simpletunnel-darwin-arm64"
      sha256 "50f36441f0dbc9c1ddf37e87909e622497a67eb68acd537c109483b363baadf3"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.52.2/simpletunnel-darwin-amd64"
      sha256 "741b76bc249f1b7b44242ba23b2e942cbd07c6dade951fe19905ebcc2c1d9daf"
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
