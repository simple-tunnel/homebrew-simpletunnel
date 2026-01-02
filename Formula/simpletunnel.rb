class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.25.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.17/simpletunnel-darwin-arm64"
      sha256 "a99edbe065cb05dfe93f20514e86c544c729b47cadb950a90d9742bebb4d83fd"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.25.17/simpletunnel-darwin-amd64"
      sha256 "caf822690ade9ff13414d7ceb89542dc005dee4f093f6d08cd4fac23fe97de36"
    end
  end

  def install
    bin.install "simpletunnel-darwin-#{Hardware::CPU.arch}" => "simpletunnel"
  end

  def caveats
    <<~EOS
      SimpleTunnel requires an API key to function.

      1. Get your API key from https://simpletunnel.com
      2. Use SimpleTunnel:
         simpletunnel -port 3000 -key YOUR_API_KEY

      For more information, visit https://simpletunnel.com/docs
    EOS
  end

  test do
    assert_match "SimpleTunnel", shell_output("#{bin}/simpletunnel -h 2>&1", 1)
  end
end
