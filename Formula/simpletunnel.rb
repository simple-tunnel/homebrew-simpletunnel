class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.22.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.22.0/simpletunnel-darwin-arm64"
      sha256 "be79c91886a55d1f22a58bfdcdb589ba6e0395280db5dba68af6136944641901"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.22.0/simpletunnel-darwin-amd64"
      sha256 "4d8698d271a873b5df46dcc5632f27974e276bdbc76b49f37d6e9062af9dba62"
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
