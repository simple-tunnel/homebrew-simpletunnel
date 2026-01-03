class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.28.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.28.2/simpletunnel-darwin-arm64"
      sha256 "95833eb88ed146bc735b23d3d4a7814f8958773c68083db692fc76f1b73e16e6"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.28.2/simpletunnel-darwin-amd64"
      sha256 "6767629e525fe878d5763449b6ac2019b308df009ff2b63530e2bc04d544dab5"
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
