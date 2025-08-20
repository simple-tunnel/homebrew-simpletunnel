class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.2.9"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.9/simpletunnel-darwin-amd64"
    sha256 "03541bfab32ee4ac1c74269253c91671f45ee3f7740fe46bb6f894420adecad9"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.9/simpletunnel-darwin-arm64"
    sha256 "40ac21a8ebebeeb248bafa222880ff5684dbe196210d6e4bff5185c9e3b2fbfa"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
