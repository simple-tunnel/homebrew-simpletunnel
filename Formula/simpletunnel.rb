class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.2.6"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.6/simpletunnel-darwin-amd64"
    sha256 "239ce97e3484e6ecb79497d19a98493968860d08cd868b7e3a062e577eab1a9b"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.6/simpletunnel-darwin-arm64"
    sha256 "1b672a19789dfdfc127fda7353dac7cab3de6011ae5e1d5ced42e97d5e7cb07d"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
