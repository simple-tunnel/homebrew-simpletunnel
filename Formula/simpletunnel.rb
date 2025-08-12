class Simpletunnel < Formula
  desc "Simple and secure tunneling solution"
  homepage "https://github.com/simple-tunnel/releases"
  version "2.1.40"

  if Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.40/simpletunnel-darwin-amd64"
    sha256 "d1157f5544db542cf97edb25880fc0921e172fbd4dbcc3eb168c608c3d072425"
  elsif Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.40/simpletunnel-darwin-arm64"
    sha256 "78cef69730d9e03a4416eb3f31182a03fc7037adf0879c22db58d0666b1f4b86"
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  test do
    system "#{bin}/simpletunnel", "--version"
  end
end
