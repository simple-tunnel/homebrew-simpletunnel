class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.15.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.8/simpletunnel-darwin-arm64"
      sha256 "6bfbda52b748bb1784a9dcc9deb0ef88a594134aed966220c9c232c427a85581"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.8/simpletunnel-darwin-amd64"
      sha256 "0c0688bc3adeacee0d9c7f64f8f6efbe041de949321702810a2dd6426c20124e"
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
