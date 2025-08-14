class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.61"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.61/simpletunnel-darwin-amd64"
    sha256 "26bb598cb6407c07b6b5807e2221d82563092babf1fa1f28de7ca11a6ddc789f"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.61/simpletunnel-darwin-arm64"
    sha256 "e41a7223c5de15ebf61b892bdd77430add6d0bdd3095917f773ed63279194123"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
