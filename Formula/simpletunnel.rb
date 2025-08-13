class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.49"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.49/simpletunnel-darwin-amd64"
    sha256 "97891c2fa76a2b5bf6506d53a34905e1abc282a950a7a03c6a6affa5ce6babf7"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.49/simpletunnel-darwin-arm64"
    sha256 "ade2ea454c4dce7eb38cfc31ee4f2b3ea55567c8b230824a1f2a70a03a4e04cd"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
