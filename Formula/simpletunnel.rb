class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.5"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.5/simpletunnel-darwin-amd64"
    sha256 "90a52048ef6fb61080e66aa9a03dd1f772472b4ce93922d425759d590ff4e52c"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.5/simpletunnel-darwin-arm64"
    sha256 "c72880920fa885c8d13d60c86eb245c8b2bdc54856b725b029253886c24df75a"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
