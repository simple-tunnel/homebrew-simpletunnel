class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.2.1"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.1/simpletunnel-darwin-amd64"
    sha256 "62b4d84044110c2df85b0c48b8c04c3be10ea0591f26306270854387258ef97c"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.1/simpletunnel-darwin-arm64"
    sha256 "e2d17d01bb8a60ff2e7a2b089c373790f5b24619e9094fa8a577510c667e1e64"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
