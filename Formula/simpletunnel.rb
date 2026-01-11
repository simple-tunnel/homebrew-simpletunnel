class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.51.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.51.0/simpletunnel-darwin-arm64"
      sha256 "26c7a21aab270c7b370a8ff4c8489695e4751b8063e5b06e24bea556d045cd07"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.51.0/simpletunnel-darwin-amd64"
      sha256 "83094a39092b9020164c399f83781caa07e2d65abba2c01271fc093c412c3b56"
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
