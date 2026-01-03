class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.28.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.28.6/simpletunnel-darwin-arm64"
      sha256 "9c1fd3c34d91a8fc6d67079465a740ad874257acac206170c7e4a8a8299de5cf"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.28.6/simpletunnel-darwin-amd64"
      sha256 "f62b5b7945d61f405c3de92b3b1ad110e409f06dead6dbf2fdbe59057e4be241"
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
