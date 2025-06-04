class Simpletunnel < Formula
  desc "Expose local services to the internet with automatic HTTPS"
  homepage "https://simpletunnel.com"
  version "2.1.0"
  license "Proprietary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.0/tunnel-client-darwin-arm64"
    sha256 "70f95533925d401d8b0f5e2cb640a79762108caa57df18bcbc2bf5eabafea942"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.0/tunnel-client-darwin-amd64"
    sha256 "9a320f453b4eae4d37f8170cd683d5771e071e6940942b945d49a736160a7cc9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/simple-tunnel/releases/releases/download/v2.1.0/tunnel-client-linux-amd64"
    sha256 "314736f7fc5496c79cd912f597081ee4efa0893dc0eb440f8e7d49b6639696dc"
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
    # Test that it shows free tier message
    assert_match "FREE tier mode", shell_output("#{bin}/simpletunnel -port 8080 2>&1", 1)
  end
end