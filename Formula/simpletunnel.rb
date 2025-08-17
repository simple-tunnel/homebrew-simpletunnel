class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.75"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.75/simpletunnel-darwin-amd64"
    sha256 "bf47e9b52cf96813833b8dfc54a9aa6389d18c4d56dee1be13dc8eaa0d010735"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.75/simpletunnel-darwin-arm64"
    sha256 "115cd320ccc37fd0ae28bf7ee8ac1624971ab988b4cc009f140730a7fd8f0d70"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
