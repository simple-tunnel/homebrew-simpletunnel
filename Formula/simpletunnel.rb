class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.2.4"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.4/simpletunnel-darwin-amd64"
    sha256 "8e18a1f21fa85629d282281ecef15a4bf758143062e6350d4f2b981a65e9ba60"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.4/simpletunnel-darwin-arm64"
    sha256 "8af21f34f9b11d088d830aa727446533592eb55d4391dc22668f995a93bac6e2"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
