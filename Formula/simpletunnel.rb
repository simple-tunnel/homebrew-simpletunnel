class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.7.0/simpletunnel-darwin-arm64"
      sha256 "114ed3e43140a7c6122ca83bbd8cc4d65ce4a72e48be5baf9abfe904706dbf65"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.7.0/simpletunnel-darwin-amd64"
      sha256 "c1d659194f17a157f2212b7de7a79284ac6ca4043c43d1ace6e9f4321f68ce32"
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
