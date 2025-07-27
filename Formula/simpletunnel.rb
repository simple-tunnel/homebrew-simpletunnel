class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "1.19.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v1.19.2/simpletunnel-darwin-arm64"
      sha256 "6baf896d9c32d526ccf7636542261041b394aa346cde63d4a19dafb305058751"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v1.19.2/simpletunnel-darwin-amd64"
      sha256 "6baf896d9c32d526ccf7636542261041b394aa346cde63d4a19dafb305058751"
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
