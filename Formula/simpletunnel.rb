class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.52.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.52.8/simpletunnel-darwin-arm64"
      sha256 "2384b056333c55617b3318fb347dd8c5ba1d61dc089c25c6671da41753cf0794"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.52.8/simpletunnel-darwin-amd64"
      sha256 "f9d56c9d90354010add92a3cf6830c699efe9de42f05dd6a6c7b482e4b08f5a3"
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
