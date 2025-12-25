class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.15.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.9/simpletunnel-darwin-arm64"
      sha256 "97d04aa84f7bf38c7843bc02d5f1fd1ba96c091ac07e143a758b232bd75c52ec"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.15.9/simpletunnel-darwin-amd64"
      sha256 "ca160e2e0d35c2fea606fc525fa7924864c86fefdfcf0b577523ab30e3616311"
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
