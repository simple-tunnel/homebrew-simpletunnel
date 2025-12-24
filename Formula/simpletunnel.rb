class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.13.0/simpletunnel-darwin-arm64"
      sha256 "cda6c36a0e3c72e65f26049ee8ff5ab5ceb8e0889e72dd9ffdbccc53303acd8c"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.13.0/simpletunnel-darwin-amd64"
      sha256 "732e490a1659cb92c98fa3bee035cac6a28f42afe60c31e9f90a041f71f1dc7e"
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
