class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.59"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.59/simpletunnel-darwin-amd64"
    sha256 "416ce619bf6753d115a84e7155da87602de4e7858b140332a341ec8e5249320e"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.59/simpletunnel-darwin-arm64"
    sha256 "87463cabc4e58815dd6141e493e97393d8129ef08f0aefc9f1a62c8b30edeade"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
