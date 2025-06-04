class Simpletunnel < Formula
  desc "Expose local services to the internet with automatic HTTPS"
  homepage "https://simpletunnel.com"
  version "2.2.0"
  license "Proprietary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.0/simpletunnel-darwin-arm64"
    sha256 "5ef1d44da8b06fe08e7e500bc4dde3490b33c5333470f174e40444d931767746"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.0/simpletunnel-darwin-amd64"
    sha256 "989c19d7f7c11a2707429a8e14399b03d2aba866d8b40cb65ebe16b972f7fbbf"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.2.0/simpletunnel-linux-amd64"
    sha256 "024e063822e2ae8d2e4d4af591fde459e1ecae57f61d63267d2bed5517f839fb"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "simpletunnel-darwin-arm64" => "simpletunnel"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "simpletunnel-darwin-amd64" => "simpletunnel"
    elsif OS.linux?
      bin.install "simpletunnel-linux-amd64" => "simpletunnel"
    end
  end

  test do
    # Test that it shows free tier message
    assert_match "FREE tier mode", shell_output("#{bin}/simpletunnel -port 8080 2>&1", 1)
  end
end