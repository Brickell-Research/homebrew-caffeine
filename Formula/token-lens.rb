class TokenLens < Formula
  desc "Flame graphs for Claude Code token usage"
  homepage "https://github.com/Brickell-Research/token-lens"
  license "MIT"
  version "0.10.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.10.0/token-lens-0.10.0-macos-arm64.tar.gz"
    sha256 "f2dccfaaf5aeeca1a376de3f8bc06a494c6e41581ad5a65a68ccfffc2efcba3b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.10.0/token-lens-0.10.0-macos-x64.tar.gz"
    sha256 "91ce75eb2b5399b6eecbd9694f262420a1dff527dfc1176692a0575dfafc811c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.10.0/token-lens-0.10.0-linux-x64.tar.gz"
    sha256 "7a60943a1503c0bf0fc32bc091ca071f02e271a8a80a0d46ffee9db0e58696d2"
  end

  def install
    bin.install "token-lens"
  end

  test do
    system "#{bin}/token-lens", "--version"
  end
end
