class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.28"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.28/simpletunnel-darwin-amd64"
    sha256 "69c87218b2b204303508616d6ee77b9cbf526dde23b19342c8b2424c6b47bf9f"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.28/simpletunnel-darwin-arm64"
    sha256 "e697bbda192de15704cd934c0e16c2168597372adde0072b2bd7d09a085b7032"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
