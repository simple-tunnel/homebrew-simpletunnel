class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.30.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.30.0/simpletunnel-darwin-arm64"
      sha256 "5308ff24b290f729cbf06fd6048707c1d69c5b6e7c0720fba282622d8affd72a"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.30.0/simpletunnel-darwin-amd64"
      sha256 "b582ee72f00491df30a36c78dd477b7cb2658e142124e5333cf597c7a5bd6a12"
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
