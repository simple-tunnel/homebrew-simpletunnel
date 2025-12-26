class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.17.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.9/simpletunnel-darwin-arm64"
      sha256 "8b6f47a170e4afff0c65a018815d809fdd4b3d9140a51237a106af0d893e9702"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.9/simpletunnel-darwin-amd64"
      sha256 "6476e4ce2f750ca73dab04eef77103a465068600e92f18a690996f6ea61f069e"
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
