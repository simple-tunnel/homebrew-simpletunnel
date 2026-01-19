class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.73.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.73.0/simpletunnel-darwin-arm64"
      sha256 "df5223db917bda8890d62a4cb56d159759b2d1ddd5f9b818b166df9da6daaf9b"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.73.0/simpletunnel-darwin-amd64"
      sha256 "a82e0e6d42e906abbbfca277b540ff4cbaa7be31ce8d2bbf2fb922b034f15d17"
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
