class TokenLens < Formula
  desc "Flame graphs for Claude Code token usage"
  homepage "https://github.com/Brickell-Research/token-lens"
  license "MIT"
  version "0.11.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.11.2/token-lens-0.11.2-macos-arm64.tar.gz"
    sha256 "83696305a1dcdd44df67c9bfbe9b27b17c9f33a9016eeb55e3cf896108f68a0b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.11.2/token-lens-0.11.2-macos-x64.tar.gz"
    sha256 "af05d626e5acbbc71ebf8e5f6ccba31a6fe1a976de4bf1e7217a77a1c92d00f9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.11.2/token-lens-0.11.2-linux-x64.tar.gz"
    sha256 "0de2837d2e4342f511b6dba53c5d802f6fcc6322dc47ad7abf86ab53dc3305c3"
  end

  def install
    bin.install "token-lens"
  end

  test do
    system "#{bin}/token-lens", "--version"
  end
end
