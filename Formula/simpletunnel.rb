class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.6.0/simpletunnel-darwin-arm64"
      sha256 "e17531ef3fd10c3ce254cb876e349d2eee12eb72715f743f62310cafdccbab1c"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.6.0/simpletunnel-darwin-amd64"
      sha256 "2e0c439d3a02af0a34daef22cdb0fd9b3511e4901a103b2513e46d97c287a384"
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
