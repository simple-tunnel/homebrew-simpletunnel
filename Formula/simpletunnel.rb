class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.20.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.20.0/simpletunnel-darwin-arm64"
      sha256 "529d30aba89ca1a448e49cfd66807c3feea80cbdfcc0313ea0e62f807c450b9f"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.20.0/simpletunnel-darwin-amd64"
      sha256 "3b650620f25a6ef4ce50d442b10b148eeaf3a69ac2438a7cc8fee7ed4723197a"
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
