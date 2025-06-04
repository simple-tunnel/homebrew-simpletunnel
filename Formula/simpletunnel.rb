class Simpletunnel < Formula
  desc "Expose local services to the internet with automatic HTTPS"
  homepage "https://simpletunnel.com"
  version "2.4.0"
  license "Proprietary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.4.0/simpletunnel-darwin-arm64"
    sha256 "a9ba750c58f1f07af50364717fa8ed27ac19a1882a55c50da69c45e870c6d2e4"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.4.0/simpletunnel-darwin-amd64"
    sha256 "af00a558c67b272e582f55946ff54a5d98db086b1ab04d87d0fc6c1728d6aa72"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.4.0/simpletunnel-linux-amd64"
    sha256 "cad62c48a22c222292bcc814c4cb7035379d661dfa418f137f28bf5e37bd7dc8"
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