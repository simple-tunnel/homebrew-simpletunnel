class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.76"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.76/simpletunnel-darwin-amd64"
    sha256 "8734b42ebe2f3a6432b0dcb1928e8f2fdb884e3c70389291efb85f33ef505f48"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.76/simpletunnel-darwin-arm64"
    sha256 "85432e4e64927a254f7abafbe55b18eea9f76b97b2b6dda6142e24efd12e0fad"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
