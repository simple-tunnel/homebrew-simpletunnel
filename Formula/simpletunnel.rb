class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.22"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.22/simpletunnel-darwin-amd64"
    sha256 "d6389e87c273c6ec985c458500254d89ad3489f2a81c96784d560bd01575392d"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.22/simpletunnel-darwin-arm64"
    sha256 "5799d573a1d96f2437548e86ec37511d70d77f4d4f5327373d1b31f3690f8762"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
