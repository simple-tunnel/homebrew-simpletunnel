class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.30"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.30/simpletunnel-darwin-amd64"
    sha256 "23d08ce1c88f28698d0e233e9630a8eaa87a6e7cca1c99721691654fb9bf1bc2"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.30/simpletunnel-darwin-arm64"
    sha256 "008d5582329d43a00f25a6090468925890963b8bc6b0c6a6501b469055868090"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
