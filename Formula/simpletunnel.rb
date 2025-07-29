class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.0.6"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.0.6/simpletunnel-darwin-amd64"
    sha256 "48da9972fb1243be7e064593287629136a0168c5f1e6466344b130046d89665e"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.0.6/simpletunnel-darwin-arm64"
    sha256 "48da9972fb1243be7e064593287629136a0168c5f1e6466344b130046d89665e"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
