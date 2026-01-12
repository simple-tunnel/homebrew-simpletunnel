class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.52.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.52.6/simpletunnel-darwin-arm64"
      sha256 "e3145092e1478ebfed2766d9cc27acb6275ac666b4bf72ccc2ee389921a01bda"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.52.6/simpletunnel-darwin-amd64"
      sha256 "fc829cd5a2fa5ae339bdd34d0fe70b9878598810b1999c3cacb5a36c32d7cfbb"
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
