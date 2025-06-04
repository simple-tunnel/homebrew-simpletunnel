class Simpletunnel < Formula
  desc "Expose local services to the internet with automatic HTTPS"
  homepage "https://simpletunnel.com"
  version "1.4.0"
  license "Proprietary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v1.4.0/tunnel-client-darwin-arm64"
    sha256 "54d908e2b031acc113247b6398dd18a8356685895bc0808d0b52c6eb9574938a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v1.4.0/tunnel-client-darwin-amd64"
    sha256 "a5348f35b552606ed7744e84dbfda04899ddccaad702eeeabfa32bcbbc91c616"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v1.4.0/tunnel-client-linux-amd64"
    sha256 "7a9889c768fe09a88dffc56755249510f5378eb864b82cc25ef63cea1c94092f"
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