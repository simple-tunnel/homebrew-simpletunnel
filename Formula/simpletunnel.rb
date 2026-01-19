class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.74.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.74.0/simpletunnel-darwin-arm64"
      sha256 "35ccaaf13780ba151a9a7bf6a49a32f56ea089999d8d009b237b39424c2b52b0"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.74.0/simpletunnel-darwin-amd64"
      sha256 "a2bb133c448354fba81883a98a8f375fec777a366a67246760bd431c519e5bff"
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
