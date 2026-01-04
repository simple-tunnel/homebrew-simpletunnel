class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.32.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.32.0/simpletunnel-darwin-arm64"
      sha256 "169a856fd8ffcbc96e2bff43978d22c7afa4e96c04c4abc75a5cfd1ae3603b8b"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.32.0/simpletunnel-darwin-amd64"
      sha256 "6bb0a5d36cccab8200eb39d9b5fd02c6ba1bb766cf5b214d694ecfc722cffba8"
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
