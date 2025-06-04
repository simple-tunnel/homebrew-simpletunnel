class Simpletunnel < Formula
  desc "Expose local services to the internet with automatic HTTPS"
  homepage "https://simpletunnel.com"
  version "0.1.0"
  license "Proprietary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v0.1.0/simpletunnel-darwin-arm64"
    sha256 "e0c37f88a6e9815dba8cfa9bf7438c89203d0269a1d5b7bfd812bd05c1079d17"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v0.1.0/simpletunnel-darwin-amd64"
    sha256 "8d860fc25f876c772d0c37af76d6ff9ad844c276a15dc3e3a618963a47d7722e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v0.1.0/simpletunnel-linux-amd64"
    sha256 "6c20d89e59fc202068476596425b2eea8b2404e82bcaf726961f251890048433"
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
    assert_match "Usage:", shell_output("#{bin}/simpletunnel --help 2>&1", 2)
  end
end