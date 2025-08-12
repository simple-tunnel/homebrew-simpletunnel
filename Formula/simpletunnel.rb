class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.37"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.37/simpletunnel-darwin-amd64"
    sha256 "690487ef007efb4755aef9b366248f7fe5fdd4f7ac01aa997badc92dfd121117"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.37/simpletunnel-darwin-arm64"
    sha256 "d427d3729530cc09519e48f24418ec37debb64fae102f1e504ab03feacac525b"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
