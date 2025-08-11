class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.33"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.33/simpletunnel-darwin-amd64"
    sha256 "15d515ea8f7551582dda20fd6cc6ddbcfdc48f15b830235de1b3911a3e921d40"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.33/simpletunnel-darwin-arm64"
    sha256 "90a3bd9eb6bc510b23130bd3c33f277691e52a92f9bee4eb2e26327109073664"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
