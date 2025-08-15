class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.67"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.67/simpletunnel-darwin-amd64"
    sha256 "f497c37b76371e2f0c8af723e156278bec3bc0c7e58a348064962f5f5415fd53"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.67/simpletunnel-darwin-arm64"
    sha256 "d5c1a91ed81375fe87871809ce9d21f38d446692192af766ac033a9f7f3d4c9e"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
