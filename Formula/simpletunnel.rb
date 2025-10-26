class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.2.53"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.53/simpletunnel-darwin-amd64"
    sha256 "ae8182c526bebb7e4284c3fc496b4bfc61a33b33fff157470c50529584c85d16"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.53/simpletunnel-darwin-arm64"
    sha256 "d5aec36a910c112712cf579963713a225724ec3765711ce769b702c4535a385e"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
