class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.1.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.1.16/simpletunnel-darwin-arm64"
      sha256 "36fcafea2a5f6a1c477483a81125d4df7140f4344bee229c5a1453e957239d07"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.1.16/simpletunnel-darwin-amd64"
      sha256 "ab1c078c1f676ed2c8e1da28dd9ac37c53e8a704e26cc1cd87030ed22a71dc76"
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
