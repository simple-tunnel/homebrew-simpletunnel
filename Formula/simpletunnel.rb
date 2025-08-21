class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.2.16"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.16/simpletunnel-darwin-amd64"
    sha256 "93c5bba67c8925ee99bdda82586ec9a19f225a3023cdb9647074aa3d10d598da"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.16/simpletunnel-darwin-arm64"
    sha256 "6c03ef57dd7741a992daa6f539770a9bc61ae274193ace9ccf1ad0fa4062c383"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
