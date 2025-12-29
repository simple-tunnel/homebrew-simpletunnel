class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.22.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.16/simpletunnel-darwin-arm64"
      sha256 "1cd5a5606cb7e77916fcce2c906f7a83b5296b6ad1f31591a1641da1c20c3e94"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.16/simpletunnel-darwin-amd64"
      sha256 "2a9ab02b0a8070b26b3851cf14cc4c99dcc717169fac45310fdb8ea947089082"
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
