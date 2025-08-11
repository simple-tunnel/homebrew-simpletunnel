class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.32"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.32/simpletunnel-darwin-amd64"
    sha256 "a7ac65f89c0c369a0fb7df8eac969caa6101f94b5508a3c4804dc70a26629f8f"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.32/simpletunnel-darwin-arm64"
    sha256 "860048e4389f8e88305f48f4e30d5e620a0b29b98669be8064f63fdaa8c1dec6"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
