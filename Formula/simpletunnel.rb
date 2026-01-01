class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.16.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.16.0/simpletunnel-darwin-arm64"
      sha256 "0edf0b0767e093949d025646c50bad89a7a7e862b1dfd362c19adad7b6ba2160"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.16.0/simpletunnel-darwin-amd64"
      sha256 "3f19b03715daa75e78514bba646cd0bde0ca75158d03d5d3fbd1b0a9a692a1bc"
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
