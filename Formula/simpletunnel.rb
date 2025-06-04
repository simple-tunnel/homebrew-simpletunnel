class Simpletunnel < Formula
  desc "Expose local services to the internet with automatic HTTPS"
  homepage "https://simpletunnel.com"
  version "1.5.0"
  license "Proprietary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v1.5.0/tunnel-client-darwin-arm64"
    sha256 "8c87102eb1b4e7d0b655d25210e0b8dd6f9ceae332c1ddf80287d82345ba82c5"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v1.5.0/tunnel-client-darwin-amd64"
    sha256 "e28509023a7347b0a5d31c688f03664c3501ad31b763c3ed629dc05012258c2b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v1.5.0/tunnel-client-linux-amd64"
    sha256 "6e3b5315dd512a875523939144b45ee181d735ea16ad72013851c6f1d23d4af4"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "tunnel-client-darwin-arm64" => "simpletunnel"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "tunnel-client-darwin-amd64" => "simpletunnel"
    elsif OS.linux?
      bin.install "tunnel-client-linux-amd64" => "simpletunnel"
    end
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/simpletunnel --help 2>&1", 2)
  end
end