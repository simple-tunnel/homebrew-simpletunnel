class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.25.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.5/simpletunnel-darwin-arm64"
      sha256 "118a5c358e43d08e6d7a85037f5e080120c3d8f8f3360d7fd217ba34888f5e1b"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.5/simpletunnel-darwin-amd64"
      sha256 "1f1e64eb1be5dc92d25526213a0fab1377b96f3deb7dafea5f595cbed6e4b889"
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
