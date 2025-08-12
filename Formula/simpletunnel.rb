class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.43"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.43/simpletunnel-darwin-amd64"
    sha256 "34b70c7caf59cb2c1bff7a5e4f9da5c4435d5bd480f0a189780822faf4eb01ea"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.43/simpletunnel-darwin-arm64"
    sha256 "d855a79729a9932db0d792176e1192244b38a2e2eb926d10fd53af75f2d8f4eb"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
