class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.39"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.39/simpletunnel-darwin-amd64"
    sha256 "9bb94959e6c502985a720f36ffaf3ad5208e48fd8580f6364064a3ccbfdfb063"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.39/simpletunnel-darwin-arm64"
    sha256 "1d0e80df910ef71858982cc276c7ccb7affe2b76dd703226ca76fd4011fe5a35"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
