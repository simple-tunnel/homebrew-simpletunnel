class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.52.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.52.4/simpletunnel-darwin-arm64"
      sha256 "d4c366f9ab5c534f02f5b6328e751264eed73fa04bf3d97d927cedc113f4cae8"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.52.4/simpletunnel-darwin-amd64"
      sha256 "f9b7ff25e2f54307a0272ca55764c4bf66b0b762f15a03471ea5e620d4c8df4e"
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
