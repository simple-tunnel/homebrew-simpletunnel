class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.22.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.15/simpletunnel-darwin-arm64"
      sha256 "3949acf9dc08060c094216979054aa23572438ec6aaf3927a7029633f2c9f3b8"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.22.15/simpletunnel-darwin-amd64"
      sha256 "347e5c71ab5f121489d690f0813b813f406ddcfc2eaa918f74542a54b861509d"
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
