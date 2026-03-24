class TokenLens < Formula
  desc "Flame graphs for Claude Code token usage"
  homepage "https://github.com/Brickell-Research/token-lens"
  license "MIT"
  version "0.9.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.9.0/token-lens-0.9.0-macos-arm64.tar.gz"
    sha256 "ff29adb4ec3beca64a9574b3321720a52eae33b2f5fd862952e06076f7458b4d"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.9.0/token-lens-0.9.0-macos-x64.tar.gz"
    sha256 "ce5c6471e62b424d655749daf34e759cfa7aa74aee2488d3ee68609f628db54f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.9.0/token-lens-0.9.0-linux-x64.tar.gz"
    sha256 "6353fd755f120094a654afa89f0db8f761e064f8e2a0a1b47117c86e3e766a26"
  end

  def install
    bin.install "token-lens"
  end

  test do
    system "#{bin}/token-lens", "--version"
  end
end
