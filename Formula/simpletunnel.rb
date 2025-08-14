class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.66"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.66/simpletunnel-darwin-amd64"
    sha256 "2fa9b91a33d90aef846c4a41b43541926be30ad396e4d12fbe4024d44ce07392"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.66/simpletunnel-darwin-arm64"
    sha256 "dc074ea6d5a36220a50c9d9aa078e0a88d13d0584e14cd54f1ff72d2b5d23e83"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
