class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.36.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.36.4/simpletunnel-darwin-arm64"
      sha256 "741fe09bc58c59db631b76fa5703a8af35323ee2fa8b8ef792a18eaf41190055"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.36.4/simpletunnel-darwin-amd64"
      sha256 "0c7212178cbec42aac9c09d15fe277071d219d497282bfa4a120210df9d232d8"
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
