class TokenLens < Formula
  desc "Flame graphs for Claude Code token usage"
  homepage "https://github.com/Brickell-Research/token-lens"
  license "MIT"
  version "0.9.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.9.1/token-lens-0.9.1-macos-arm64.tar.gz"
    sha256 "f5f63672e852b5bb20679ee02685518df372ca565a3dc681d4d3eee1ca195c4b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.9.1/token-lens-0.9.1-macos-x64.tar.gz"
    sha256 "e3960239743e8c1fae3da3d5adf9d63f30719942b71a026df10411540eddef70"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.9.1/token-lens-0.9.1-linux-x64.tar.gz"
    sha256 "586354cb1b86897561558ea94196366bcbc6b3da8ed5a3a68e4113d5d70ce876"
  end

  def install
    bin.install "token-lens"
  end

  test do
    system "#{bin}/token-lens", "--version"
  end
end
