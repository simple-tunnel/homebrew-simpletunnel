class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.24.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.24.3/simpletunnel-darwin-arm64"
      sha256 "55415a5be3ef27f544b1fbfb42a9ca95d40a54f642f6df02e3636d9a326ce338"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.24.3/simpletunnel-darwin-amd64"
      sha256 "2eb812f69ff0df5a3585c68212ff082cbdbc6cd8bf6020cfc787b1f1ce88b190"
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
