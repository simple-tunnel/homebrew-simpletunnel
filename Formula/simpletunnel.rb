class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.2.5"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.5/simpletunnel-darwin-amd64"
    sha256 "dbb21afe297b62022389ce92f577495f7a558c8238e37a0bbb3f4d9851d04da9"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.5/simpletunnel-darwin-arm64"
    sha256 "77105303216db00f6c1d2002969fc68c69efd7ca89ad1581c8340407e063e189"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
