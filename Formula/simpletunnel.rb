class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.55.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.55.7/simpletunnel-darwin-arm64"
      sha256 "023cb6b1f0743d5928e5cd982bb839486d36bbc563c96e6f22d9780a895d391c"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.55.7/simpletunnel-darwin-amd64"
      sha256 "132e09053ad65784ac7f96ed6e998572d43c02ce1d5a3af47669671634bc5943"
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
