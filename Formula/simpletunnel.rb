class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.39.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.39.0/simpletunnel-darwin-arm64"
      sha256 "cdfaca8bc2157b62588f9a58e3448cefdef57edb32a0b13c9836401777dd7dcd"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.39.0/simpletunnel-darwin-amd64"
      sha256 "3665c4509446148932c8944a1c9a403f5a942e14ef14316d789adc9234bd0837"
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
