class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.41.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.41.3/simpletunnel-darwin-arm64"
      sha256 "c5f7ec2f32d5cd0e90cea4a27ff04fb2d6f2c4d3eaa78fccbc3a0917d30d61f3"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.41.3/simpletunnel-darwin-amd64"
      sha256 "8422ab253861550b6fe3462cff8f62c75bd38c0e6dac56f909d8acc9371da358"
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
