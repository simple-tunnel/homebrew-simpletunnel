class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.24.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.24.0/simpletunnel-darwin-arm64"
      sha256 "dc28674ccfea5d6a3ef6a8932afd3e42fa6f0a95647bfd9a3b69b06e8f9df0a5"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.24.0/simpletunnel-darwin-amd64"
      sha256 "fdf3ecafbdeb305296e6b8f46f24b986764302dce1313e867a4d2e97d04a5fad"
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
