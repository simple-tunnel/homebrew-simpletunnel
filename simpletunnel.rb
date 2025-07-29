class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.0.4"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.0.4/simpletunnel-darwin-amd64"
    sha256 "665be1dc08cdd9f0f7b4c8b6e54b76fae14fbadb2d625c9345719a758324e343"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.0.4/simpletunnel-darwin-arm64"
    sha256 "665be1dc08cdd9f0f7b4c8b6e54b76fae14fbadb2d625c9345719a758324e343"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
