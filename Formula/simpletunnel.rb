class Simpletunnel < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://simpletunnel.com"
  version "3.70.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simple-tunnel/releases/releases/download/v3.70.0/simpletunnel-darwin-arm64"
      sha256 "7599aaf1efd3f650f35489e03008fb001a3a8e3164449f8ff63dc2905c291fdc"
    else
      url "https://github.com/simple-tunnel/releases/releases/download/v3.70.0/simpletunnel-darwin-amd64"
      sha256 "8e7bc36f84174c2169b60159cdccff5e7c52c01365287af3d5eae3bc9730b369"
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
