class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.44"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.44/simpletunnel-darwin-amd64"
    sha256 "be1f0fae315a4264ab448ec6ab5890154a1c5126ca477dfa6c5ef89fedf8a386"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.44/simpletunnel-darwin-arm64"
    sha256 "339a9cac12ccdbbcb6460ab890528be37919ee5bd46f3c5a288f0e30d6eb8ee8"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
