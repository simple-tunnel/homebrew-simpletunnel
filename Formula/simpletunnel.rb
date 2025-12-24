class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.10.0/simpletunnel-darwin-arm64"
      sha256 "0ceaff424df369cabd1a5056a9805979dbc7c815ec3b2a2f20810a7bc6077aff"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.10.0/simpletunnel-darwin-amd64"
      sha256 "43041429fc4a4d2bbb17406a0835bc044c97ef993a349d3c26212e89318bf776"
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
