class Simpletunnel < Formula
  desc "Expose local services to the internet with automatic HTTPS"
  homepage "https://simpletunnel.com"
  version "2.0.0"
  license "Proprietary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.0.0/simpletunnel-darwin-arm64"
    sha256 "75ed688c2910b056b8fa7c61bc9cd72b80c3693b05df46ea4993e11279346efc"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.0.0/simpletunnel-darwin-amd64"
    sha256 "dfbef4afe04d373be6f326d1a60d5ea5a8ccba7782e7449a47690bfbdeb68d44"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.0.0/simpletunnel-linux-amd64"
    sha256 "678168a0f7f79bbcdc1248b1cdcc48f7fb77f355e11ccd9312e9f98323d0d507"
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
    # Test that it shows API key error
    assert_match "API key required", shell_output("#{bin}/simpletunnel -port 8080 2>&1", 1)
  end
end