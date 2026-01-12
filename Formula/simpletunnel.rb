class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.52.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.52.3/simpletunnel-darwin-arm64"
      sha256 "5e860aeb869f4529a6e50a467eb13db3527c0830e52ed639eca2ad233ba68529"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.52.3/simpletunnel-darwin-amd64"
      sha256 "0c93257251f50949ed1448e6c054fcdbf86ef67c5d2b6efd364fb85e229914b6"
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
