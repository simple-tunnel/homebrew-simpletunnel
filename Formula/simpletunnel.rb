class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.2.3"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.3/simpletunnel-darwin-amd64"
    sha256 "094c94c72c8dc739a90c851aba17db13dbc396e7c710c21287bc6ff549f3e683"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.3/simpletunnel-darwin-arm64"
    sha256 "3d50a674bcea5251874fd329a9959c6f3f98bbf30ede90a78ae64daeffc04231"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
