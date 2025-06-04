class Simpletunnel < Formula
  desc "Expose local services to the internet with automatic HTTPS"
  homepage "https://simpletunnel.com"
  version "2.0.2"
  license "Proprietary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.0.2/simpletunnel-darwin-arm64"
    sha256 "f78f8444d6cb2bfe064401dd1e71b61ddf1aa4ba2e2ef2dc13395ce1f1f200e8"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.0.2/simpletunnel-darwin-amd64"
    sha256 "ec2880f770449c98fcca1523826c0889b999cae8fcb2f4a72d1c28dd3d851121"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.0.2/simpletunnel-linux-amd64"
    sha256 "0b28080abcf6955a3d29c6ed2f6862b6d9e7e7ee150962ec33ba0e1f9221fc3d"
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