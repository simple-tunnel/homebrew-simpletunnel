class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.26"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.26/simpletunnel-darwin-amd64"
    sha256 "594ddf6ef2d560b889e79deca63d5fca7a3b71c014c18494756329a15b72d5a2"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.26/simpletunnel-darwin-arm64"
    sha256 "bcde03f9a6e600c9f12740274ba911b6504c12d0478558b8e38572169f5655b3"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
