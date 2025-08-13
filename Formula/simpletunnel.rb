class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.48"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.48/simpletunnel-darwin-amd64"
    sha256 "fa7d1bc174120d4cabfaab0388b74817ec0227c50ac9fda2bb68213c8d4cf5f1"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.48/simpletunnel-darwin-arm64"
    sha256 "6b35a737a1b35f3409d4779883314d28624db41fdcb7140e89b71396ba89b74a"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
