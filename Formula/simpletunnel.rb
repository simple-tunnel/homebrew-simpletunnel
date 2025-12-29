class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.21.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.21.5/simpletunnel-darwin-arm64"
      sha256 "489568c5a027ce19c67990b0192d2de2fee0f5e4bf012803e5eebb0cfe546692"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.21.5/simpletunnel-darwin-amd64"
      sha256 "3e97b1106deceb63533e0acafc322ac231b652afb1f118e5bcc210cf03eae253"
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
