class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.69"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.69/simpletunnel-darwin-amd64"
    sha256 "41624d4236a9117722407a46cb8eec88c5b537363b66e30eb6e17cedc5ce52e4"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.69/simpletunnel-darwin-arm64"
    sha256 "2615fd00746a4275f2706f6030d1f7675f76505ed01faa2866e6c3645082c170"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
