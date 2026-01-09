class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.41.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.41.1/simpletunnel-darwin-arm64"
      sha256 "55d6e825e473966b1a730822583f25740691b9fa40cfe217afd1f11087a03359"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.41.1/simpletunnel-darwin-amd64"
      sha256 "50602879eb040eb72dc092a94c86c4865cdfb031720d8a8c50b4214f3e9b251b"
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
