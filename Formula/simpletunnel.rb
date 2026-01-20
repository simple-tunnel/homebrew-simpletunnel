class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.81.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.81.0/simpletunnel-darwin-arm64"
      sha256 "2e67f05c91dcab1f3a551f8a37d83589b5500f0188db4c6500aff988449cacb6"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.81.0/simpletunnel-darwin-amd64"
      sha256 "a27618d0b13f4b8bf7cfad0e44a34ed8c703298cc7e2b84576a7598e94b1753e"
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
