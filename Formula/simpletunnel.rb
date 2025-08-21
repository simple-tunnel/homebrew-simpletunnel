class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.2.17"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.17/simpletunnel-darwin-amd64"
    sha256 "5193ff23bcfefe2650c9700cb480525461c31c2c8bf680df7b290fd607c5f38a"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.17/simpletunnel-darwin-arm64"
    sha256 "fa8ca4a5e2bbba23e2d542ec048753a66c2c78002e6ea55836660e1621079478"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
