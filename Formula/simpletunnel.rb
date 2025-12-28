class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.21.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.21.3/simpletunnel-darwin-arm64"
      sha256 "cd7a7c085223199b60b48552a382d4296c59e6ba37a19225931014fa22a566cb"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.21.3/simpletunnel-darwin-amd64"
      sha256 "b0a9e4b62060613c07c372bc16ee001098d50af1cd38f148eb13c5e7d447e433"
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
