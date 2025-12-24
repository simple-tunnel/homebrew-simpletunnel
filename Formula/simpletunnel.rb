class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.8.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.8.4/simpletunnel-darwin-arm64"
      sha256 "6c2bbc15dadab5cefbe44c98ace05615698a152e683ca450b4176ee83b6d3b0f"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.8.4/simpletunnel-darwin-amd64"
      sha256 "d094d67be8b4b5fc66ed62ea6ae7d0dc91b50afd7c83f7e1b9b15c7b6d14e241"
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
