class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.7.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.7.2/simpletunnel-darwin-arm64"
      sha256 "8b496f8be9ead5039e6b78d9d35b6286e1040362bee723b3d7c990cf51906cdb"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.7.2/simpletunnel-darwin-amd64"
      sha256 "e5977cd204e5e7b34ce6b4d3e3eff7f107bc4812cc04b7079ec05d5b9fe56385"
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
