class TokenLens < Formula
  desc "Flame graphs for Claude Code token usage"
  homepage "https://github.com/Brickell-Research/token-lens"
  license "MIT"
  version "0.8.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.8.0/token-lens-0.8.0-macos-arm64.tar.gz"
    sha256 "d9d8d78f82fcf384843a69d3b2699378fa034e342fe4039ae814a1a46234f93b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.8.0/token-lens-0.8.0-macos-x64.tar.gz"
    sha256 "aa7cb6bb05831c695a552be12346a6f2bd1a2dd3ed621a18ebc245b7bdcedd19"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.8.0/token-lens-0.8.0-linux-x64.tar.gz"
    sha256 "864d70bce7b4e0f8bb18a06f2a2e91726da59f4454318bd6e00b056df3b64ded"
  end

  def install
    bin.install "token-lens"
  end

  test do
    system "#{bin}/token-lens", "--version"
  end
end
