class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.2.62"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.2.62/simpletunnel-darwin-arm64"
      sha256 "e9f8a67c52e4e63a8d29671ab09fb5020530032256428f79fe582cf8cf760a23"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.2.62/simpletunnel-darwin-amd64"
      sha256 "4ffbca1b55ff5d70752fac4f3f511cca963104190f057f89ce4d7ee5d7c3699a"
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
