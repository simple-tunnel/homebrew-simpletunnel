class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.40.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.40.2/simpletunnel-darwin-arm64"
      sha256 "3e646e4b34d50a0959106184ac1671c8f9d4e7d70ea2631866c5a7f89b399623"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.40.2/simpletunnel-darwin-amd64"
      sha256 "b3452768a7c76008c1af5c54245eac8010b39eaa8d0688c0723e762b34837e23"
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
