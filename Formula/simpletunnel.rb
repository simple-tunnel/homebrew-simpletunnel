class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.65.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.65.0/simpletunnel-darwin-arm64"
      sha256 "48fece902cca8b2950d4a595d5de04f65b1a968cc4b8c46bcefe82a522ff6e60"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.65.0/simpletunnel-darwin-amd64"
      sha256 "45cb5d960f3d3d449e40cbac59532289d2eb75dd02587ca68a5497163a92c9e6"
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
