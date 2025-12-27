class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.17.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.12/simpletunnel-darwin-arm64"
      sha256 "cf456dd24d6159b28b19c5fbc9a530318d646d1ec41353fba07fff11f5ec5a88"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.12/simpletunnel-darwin-amd64"
      sha256 "60aa859688914dec9634e218f6b69e14dbc13a00012534f194139b7db1108580"
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
