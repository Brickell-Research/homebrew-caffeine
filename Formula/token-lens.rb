class TokenLens < Formula
  desc "Flame graphs for Claude Code token usage"
  homepage "https://github.com/Brickell-Research/token-lens"
  license "MIT"
  version "0.11.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.11.0/token-lens-0.11.0-macos-arm64.tar.gz"
    sha256 "ae5954113a5fbc99304f32c259c91369018fc4de9b1ec140cba490d31093cb4e"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.11.0/token-lens-0.11.0-macos-x64.tar.gz"
    sha256 "65950030d8cdc85baa2e4faf2f257c78f9b004b5e269a20926d014eadb7a34be"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/token-lens/releases/download/v0.11.0/token-lens-0.11.0-linux-x64.tar.gz"
    sha256 "9f871fefb03a2b55cb7989e6e73408baaae54792b1bc77a5a29e615ce998db69"
  end

  def install
    bin.install "token-lens"
  end

  test do
    system "#{bin}/token-lens", "--version"
  end
end
