class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.34.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.34.3/simpletunnel-darwin-arm64"
      sha256 "71906c04d51e88b9e7c57c568bd79b93c1ba0f5321eb85048d24b8e8c00a7ab5"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.34.3/simpletunnel-darwin-amd64"
      sha256 "11b024bc6ff3ea4bb40cea1472d39d329f9cd5d98843fbc44e378ff7fa07a286"
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
