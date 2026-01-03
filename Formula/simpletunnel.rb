class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.28.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.28.0/simpletunnel-darwin-arm64"
      sha256 "774a812912902b463b6751e17a25a6436a2c5a79bfc4a9597f062fb6cadfdaf2"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.28.0/simpletunnel-darwin-amd64"
      sha256 "158d626df71f6e09900de1fe6d6f2dba09d634c1a4e33eae9af1dccc1075fb3a"
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
