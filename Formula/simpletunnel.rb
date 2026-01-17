class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.64.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.11/simpletunnel-darwin-arm64"
      sha256 "eb537f1027d116fe9e57662f8c983c19302089d22d8c75e89deea54500363095"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.64.11/simpletunnel-darwin-amd64"
      sha256 "48ebf94ab6873cd1454498b09d13a08a51b0654845db047f6b6d8566ddff1190"
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
