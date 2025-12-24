class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.14.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.14.2/simpletunnel-darwin-arm64"
      sha256 "373202553c15bab463815560eb692daca732b351f1518134ed7eb08507378189"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.14.2/simpletunnel-darwin-amd64"
      sha256 "c5a3be9f0f5c7253f0d3bd448375f386b25a0c4346e1ee15de98e994c2008ece"
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
