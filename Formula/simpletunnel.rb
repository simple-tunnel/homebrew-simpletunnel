class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.55"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.55/simpletunnel-darwin-amd64"
    sha256 "5c59ce228c51c154c39559945cec5ac8d92b7556151818b2efdcf0dbed9e1253"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.55/simpletunnel-darwin-arm64"
    sha256 "07192012280843745e5c329b212049a0194d21f63b23d3366a00587502b6999e"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
