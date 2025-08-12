class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.35"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.35/simpletunnel-darwin-amd64"
    sha256 "888ab8ae5c5a77fd15f46cf61588eb71aedbe3f7771738e418c97a22b4db8cdd"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.35/simpletunnel-darwin-arm64"
    sha256 "266d303f5c25591b467e6aea916b4cbd982a37b386aef6a89b4a263e49818bf6"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
