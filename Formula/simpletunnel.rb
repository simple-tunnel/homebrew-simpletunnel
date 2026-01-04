class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.31.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.31.3/simpletunnel-darwin-arm64"
      sha256 "d7fa50afe96cb1421938664d9a6cc541b64b385901216ba392cddcc7943fc627"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.31.3/simpletunnel-darwin-amd64"
      sha256 "5617d35afbe6116882024cfc769e3d9d9dc99e52d0014bfdec6afb16139b936e"
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
