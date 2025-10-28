class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.2.68"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.2.68/simpletunnel-darwin-arm64"
      sha256 "7179af5c5f9acf54a41c17733c2bea750b5fdb830c2787518b4bd61fbd10f4e6"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.2.68/simpletunnel-darwin-amd64"
      sha256 "1a3a5e0ddf8ca8c482ee150adbd57ecca3f1a23053a05161376e7908a5c9b5e7"
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
