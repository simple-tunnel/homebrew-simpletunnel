class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.16.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.16.0/simpletunnel-darwin-arm64"
      sha256 "c54ae3a766de84db8eabece99950830eba304719d531602093fa7606659efc5b"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.16.0/simpletunnel-darwin-amd64"
      sha256 "09e41986a056e04c1d4d6e45b072724e42b33299c516f6615bf544f0ca83ec23"
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
