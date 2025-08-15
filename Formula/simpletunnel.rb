class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.68"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.68/simpletunnel-darwin-amd64"
    sha256 "d71cbd361986faef2a24f1268cf38da240b784f17904ff996956ffda7e03ffee"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.68/simpletunnel-darwin-arm64"
    sha256 "03b45c66ae374e36af96c72cb43fa6cb4d796bcf6f08f59fa18110c922b3240c"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
