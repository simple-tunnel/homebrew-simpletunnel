class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.48.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.48.2/simpletunnel-darwin-arm64"
      sha256 "d515b2a4efe696248d8674764c7b29e7d6205ac28d89b29a11f793297408a9f8"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.48.2/simpletunnel-darwin-amd64"
      sha256 "b833bf5af1ab0c616488bad3f28b93fdaa31690097190364f3d9887b93e5a1f6"
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
