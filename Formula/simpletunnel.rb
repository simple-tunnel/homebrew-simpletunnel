class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.78"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.78/simpletunnel-darwin-amd64"
    sha256 "59655e4887b1199019ceaba7174242001d8f0a1a39d848f0eb8a2a774429d6d4"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.78/simpletunnel-darwin-arm64"
    sha256 "bd8e62be3cd23c1123de18960b47a7499b7089460f4f340705f264d934e8e7f7"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
