class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.54"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.54/simpletunnel-darwin-amd64"
    sha256 "fef8a1ba205948230d8df891a07d2afe7293b70571b61edce1e85fc863287585"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.54/simpletunnel-darwin-arm64"
    sha256 "99f12c5f8552a4514f86a6190b32df2b6aeaafafb57bb444b0db6a76522c8514"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
