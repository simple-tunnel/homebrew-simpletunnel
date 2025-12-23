class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.5.2/simpletunnel-darwin-arm64"
      sha256 "f530701426a17fafcfb26f0142d507dce6c6a23720b1015bb77379abca07b483"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.5.2/simpletunnel-darwin-amd64"
      sha256 "7ec3f147e4a8a79ff23ca9061f0e3b1f1bb70122f2a5d4199fd729152c3f081b"
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
