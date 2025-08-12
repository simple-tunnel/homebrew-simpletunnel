class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.42"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.42/simpletunnel-darwin-amd64"
    sha256 "69124713fc50e7daa6635da0433df1106e90f0595b0b620dd2f3743a406d0309"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.42/simpletunnel-darwin-arm64"
    sha256 "8c49bdec9760f09dae49bbca83c45c38f17d3d1194a435cd55f8c6ff755a8d7d"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
