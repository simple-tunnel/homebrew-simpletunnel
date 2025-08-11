class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.25"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.25/simpletunnel-darwin-amd64"
    sha256 "39e634f807e0a62f938a2131c80a877558d3dae5101c7afc242b74cc3a7ba445"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.25/simpletunnel-darwin-arm64"
    sha256 "9a0fb6d9e968d3dd70fc1d92120140f6ca2a5ba627472290b50682180c966335"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
