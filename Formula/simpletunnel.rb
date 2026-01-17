class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.64.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.14/simpletunnel-darwin-arm64"
      sha256 "ab8aeeea548b52713603f4e8d2c11bd9fb57a7f96c67d46ac844fa5952622533"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.14/simpletunnel-darwin-amd64"
      sha256 "5f0b776e98a872d28b12a0f4695354409aae9a4640659f37d4ae7196260deeb1"
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
