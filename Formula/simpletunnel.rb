class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.63"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.63/simpletunnel-darwin-amd64"
    sha256 "57124637c4a9d7db2c721423aae81b398bf6b39e8aa1da47c0abbab6ccf9d7dc"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.63/simpletunnel-darwin-arm64"
    sha256 "5ae010a396af21e49c9b128b3b73d4e48b42c06fcbad1e678e28883be4dbee8e"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
