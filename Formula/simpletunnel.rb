class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.77.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.77.0/simpletunnel-darwin-arm64"
      sha256 "27dcb138652c7188a0c8322af4bc172dab9aedc55f2400a9f12ac26ec449e506"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.77.0/simpletunnel-darwin-amd64"
      sha256 "51d6d4298962ccaf05e1096b577d60aaa201aaf07759c29e9883a61b367f9e47"
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
