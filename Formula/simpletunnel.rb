class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.38"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.38/simpletunnel-darwin-amd64"
    sha256 "dabca88e1d4afdf3c5bf3efb5e33b2ee0c42ae7db1c4c9d1a287b2bcc621f11f"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.38/simpletunnel-darwin-arm64"
    sha256 "2ad05711a3c97cc4d00c8b4f597423eab5168536a878892bc3bee427741fda86"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
