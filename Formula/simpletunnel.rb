class Simpletunnel < Formula
  desc "Expose local services to the internet with automatic HTTPS"
  homepage "https://simpletunnel.com"
  version "1.2.0"
  license "Proprietary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v1.2.0/tunnel-client-darwin-arm64"
    sha256 "5ef1d44da8b06fe08e7e500bc4dde3490b33c5333470f174e40444d931767746"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v1.2.0/tunnel-client-darwin-amd64"
    sha256 "PLACEHOLDER_INTEL_MAC_SHA256"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v1.2.0/tunnel-client-linux-amd64"
    sha256 "024e063822e2ae8d2e4d4af591fde459e1ecae57f61d63267d2bed5517f839fb"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "tunnel-client-darwin-arm64" => "simpletunnel"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "tunnel-client-darwin-amd64" => "simpletunnel"
    elsif OS.linux?
      bin.install "tunnel-client-linux-amd64" => "simpletunnel"
    end
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/simpletunnel --help 2>&1", 2)
  end
end