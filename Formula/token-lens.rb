class TokenLens < Formula
  desc "Flame graphs for Claude Code token usage"
  homepage "https://github.com/Brickell-Research/token-lens"
  license "MIT"
  version "0.7.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.7.0/token-lens-0.7.0-macos-arm64.tar.gz"
    sha256 "2677b3c659ab39fd388269662de38f097160836369131c75411b5b1bb09a8929"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.7.0/token-lens-0.7.0-macos-x64.tar.gz"
    sha256 "d2be80da6d0f870ab23e3d7ce887fb70de18e3ffea2f4f25f998e2c1d1959c92"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.7.0/token-lens-0.7.0-linux-x64.tar.gz"
    sha256 "bcdfad223e4f37b7722a9effce30c1ee34c2a397800f7cf743ab6495ac02cd80"
  end

  def install
    bin.install "token-lens"
  end

  test do
    system "#{bin}/token-lens", "--version"
  end
end
