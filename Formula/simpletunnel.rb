class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.41"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.41/simpletunnel-darwin-amd64"
    sha256 "e92c10a2777c2c752722cd36e70f6414bd43baf4499b4f18ff6f2126fc8c4c7f"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.41/simpletunnel-darwin-arm64"
    sha256 "bffa0c46796539a6ea849b6ab77b9c2ad4605970f46d81168a301472c938e1ee"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
