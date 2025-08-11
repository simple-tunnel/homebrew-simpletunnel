class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.31"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.31/simpletunnel-darwin-amd64"
    sha256 "d52de0ed209df4f5577518e1bc0af9114b1c40be0842d314bec138171884128d"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.31/simpletunnel-darwin-arm64"
    sha256 "cd3756f8fb615eeaa269c1fbea84411e705883275c8d7d545eff659d5d4dc1cd"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
