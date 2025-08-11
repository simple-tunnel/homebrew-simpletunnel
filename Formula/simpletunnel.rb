class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.23"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.23/simpletunnel-darwin-amd64"
    sha256 "ab5e88614f93f34eea0e3a5d9cc328bd4042e6f74c59c578886cf55ada1fed8e"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.23/simpletunnel-darwin-arm64"
    sha256 "34c06172973f9643e07730d65e1909781bf70b6829f2371b63082738c1679cc8"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
