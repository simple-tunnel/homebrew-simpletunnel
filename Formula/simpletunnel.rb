class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.34"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.34/simpletunnel-darwin-amd64"
    sha256 "3018da924068f7e306b6820b20876ea5269086f10ec3cc4f0c113d7c15f25a56"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.34/simpletunnel-darwin-arm64"
    sha256 "2e3cf6c9013628dc265a183926f67e13f7bb593b471d5960bb1c7dffcc1ca498"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
