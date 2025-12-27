class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.18.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.0/simpletunnel-darwin-arm64"
      sha256 "61569a64b23f0c82261c726a4b943672132efb51cb73ad9a2e3e84b180b48460"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.18.0/simpletunnel-darwin-amd64"
      sha256 "d765e8b93c94aa3e7aca4bcb26271cb8bc8e1ac184ef91d1af9e6494c2ac5dff"
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
