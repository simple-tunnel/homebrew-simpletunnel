class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "2.17.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.4/simpletunnel-darwin-arm64"
      sha256 "48ea44e9e7edc154cb9093b5bdd1e52445f2724797652f0e2893cdbedf2fceaa"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v2.17.4/simpletunnel-darwin-amd64"
      sha256 "001683da3fc49c32c8d9aa3e6b779fa393b2ced7d1d27c5f0397d956309d0f35"
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
