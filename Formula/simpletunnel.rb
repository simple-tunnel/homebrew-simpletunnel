class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.27"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.27/simpletunnel-darwin-amd64"
    sha256 "476f99fbf2f1ea42c09995073840e08979468cc675be6db5771dde15607ee9d3"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.27/simpletunnel-darwin-arm64"
    sha256 "bbffdf0220362bdf00da12dbb45ba6e0f931b4c0b6dc36b6f503833fabdad69a"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
