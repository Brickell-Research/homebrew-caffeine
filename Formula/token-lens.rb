class TokenLens < Formula
  desc "Flame graphs for Claude Code token usage"
  homepage "https://github.com/Brickell-Research/token-lens"
  license "MIT"
  version "0.11.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.11.3/token-lens-0.11.3-macos-arm64.tar.gz"
    sha256 "f727b0560bd1e4db3c9ccaf0101d07216cdc0435a80087813e36097d6b4fbaaa"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.11.3/token-lens-0.11.3-macos-x64.tar.gz"
    sha256 "ff772d997a153226451ee99569c3f045a6b2867c95ff7cf48c35d65a114150e0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.11.3/token-lens-0.11.3-linux-x64.tar.gz"
    sha256 "6c34bb115fd629d7f523c6acb681846b1e2b09d06a7272ce095754dfdf8b668b"
  end

  def install
    bin.install "token-lens"
  end

  test do
    system "#{bin}/token-lens", "--version"
  end
end
