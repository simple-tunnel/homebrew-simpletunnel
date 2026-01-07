class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.37.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.37.0/simpletunnel-darwin-arm64"
      sha256 "a202a269b88c4134790c9c838a20a615dcd8ef4d7e982530d496867f86e207e7"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.37.0/simpletunnel-darwin-amd64"
      sha256 "75f6a5c8a97b28e517aea47af0f6007023bdbc935cc38bff31565682028a6370"
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
