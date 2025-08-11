class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.29"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.29/simpletunnel-darwin-amd64"
    sha256 "571028ae240fdd1082d3d81e10fc3944d2493c9962f1bafe87d69c4edd37a219"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.29/simpletunnel-darwin-arm64"
    sha256 "ee65b4282e5fc89716fedc20a7817fd4a046f01edc5035431bf625f50166014c"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
