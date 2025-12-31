class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.14.0/simpletunnel-darwin-arm64"
      sha256 "2a841213afa3c644ee09914a0e7481049747aaabefbdcc3cd82b00cdfec9f644"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.14.0/simpletunnel-darwin-amd64"
      sha256 "dd3ff6aa19b627dba41d2960b44ee757853e39c7692e741634d061f31c8bf9d8"
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
