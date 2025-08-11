class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.24"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.24/simpletunnel-darwin-amd64"
    sha256 "761d5f9925819b8052cca59e880cfa4791e0215485a79231ba18db12fef93ba9"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.24/simpletunnel-darwin-arm64"
    sha256 "5d1b090661a580520e088fcf5610d081075a627728e77a40ddafeb2c355cbc63"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
