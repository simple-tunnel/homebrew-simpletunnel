class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.61.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.61.0/simpletunnel-darwin-arm64"
      sha256 "0cf6469a38ecae3ea5cf07e515d31a26ecf889bab14ed7ae9b23e4bc80e44b60"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.61.0/simpletunnel-darwin-amd64"
      sha256 "b07acf77fae48880e896560a80342a48b0040c788c7d38e2b399fea783100cf2"
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
