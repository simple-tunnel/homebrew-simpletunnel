class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.25.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.14/simpletunnel-darwin-arm64"
      sha256 "de17750dff2b5d5c43a2a426ba17cae19b0aab713a17549952d70a1066be0637"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.14/simpletunnel-darwin-amd64"
      sha256 "ff494104a0a92a7554d2d7f12f313e460f3201b92143a806e376baab6e53611c"
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
