class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.11.0/simpletunnel-darwin-arm64"
      sha256 "8bd563687c79ada861e4efd117d6034f0a275c012b1bdf35d344e03f352fc764"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.11.0/simpletunnel-darwin-amd64"
      sha256 "b90d307efe6c382c44b4b47adb4784ecf1e13fad11fbb549e136939b76749e6c"
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
