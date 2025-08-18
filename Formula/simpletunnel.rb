class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.79"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.79/simpletunnel-darwin-amd64"
    sha256 "b567ffac6598d5fa610aade9aeddc75b2852ad2d580987543821fc041bb3954f"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.79/simpletunnel-darwin-arm64"
    sha256 "febe08aac50af2436af6bf679d9eacec10a15ff3d1d03530de47386a168bf488"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
