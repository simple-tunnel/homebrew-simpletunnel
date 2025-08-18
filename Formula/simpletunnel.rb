class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.2.0"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.0/simpletunnel-darwin-amd64"
    sha256 "989c19d7f7c11a2707429a8e14399b03d2aba866d8b40cb65ebe16b972f7fbbf"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.0/simpletunnel-darwin-arm64"
    sha256 "5ef1d44da8b06fe08e7e500bc4dde3490b33c5333470f174e40444d931767746"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
