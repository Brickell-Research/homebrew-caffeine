class TokenLens < Formula
  desc "Flame graphs for Claude Code token usage"
  homepage "https://github.com/Brickell-Research/token-lens"
  license "MIT"
  version "0.9.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.9.2/token-lens-0.9.2-macos-arm64.tar.gz"
    sha256 "f3df2e5003f92ef1be343d1ef2aa88900b7679539b6308235c208873f8e6a9c9"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.9.2/token-lens-0.9.2-macos-x64.tar.gz"
    sha256 "2be8d49224388fd07f2c99a098737dfd28fd30f2aa98828d97de23581a846961"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.9.2/token-lens-0.9.2-linux-x64.tar.gz"
    sha256 "c44469039495dd1a3faea3bb88cbe0bc1834dcc25d48aa3992675f017b54236c"
  end

  def install
    bin.install "token-lens"
  end

  test do
    system "#{bin}/token-lens", "--version"
  end
end
