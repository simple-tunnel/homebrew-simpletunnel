class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.2.8"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.8/simpletunnel-darwin-amd64"
    sha256 "918dc4ad1f8e26c23fab3829b99e45d64c5964856928fefbdbd9f85c5079b24c"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.8/simpletunnel-darwin-arm64"
    sha256 "9a5f9723a7f50c4d6a644dbad33bbcb560559a3050252fecbd15f2176034103c"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
