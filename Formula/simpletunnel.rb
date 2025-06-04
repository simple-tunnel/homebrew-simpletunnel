class Simpletunnel < Formula
  desc "Expose local services to the internet with automatic HTTPS"
  homepage "https://simpletunnel.com"
  version "2.0.1"
  license "Proprietary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.0.1/simpletunnel-darwin-arm64"
    sha256 "9d0ec7039130940242539be34a622f23db4e2c9a2ece4a811023f98e865d8560"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.0.1/simpletunnel-darwin-amd64"
    sha256 "dfbef4afe04d373be6f326d1a60d5ea5a8ccba7782e7449a47690bfbdeb68d44"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.0.1/simpletunnel-linux-amd64"
    sha256 "f6855e6df256db21d34f62a8826aecd74ea4a164794bdbe62e7d0a9518b39ced"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "simpletunnel-darwin-arm64" => "simpletunnel"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "simpletunnel-darwin-amd64" => "simpletunnel"
    elsif OS.linux?
      bin.install "simpletunnel-linux-amd64" => "simpletunnel"
    end
  end

  test do
    # Test that it shows free tier message
    assert_match "FREE tier mode", shell_output("#{bin}/simpletunnel -port 8080 2>&1", 1)
  end
end