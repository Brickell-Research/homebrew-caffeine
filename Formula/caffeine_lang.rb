class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.7.5"

  # Platform-specific downloads (each tarball contains ERTS + compiled BEAM files)
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.7.5/caffeine-4.7.5-macos-x64.tar.gz"
    sha256 "82ca34aa6c6ce29f4ed21b33c0d14eaf5e3d56b10ec8dd76786093e8f5d80a50"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.7.5/caffeine-4.7.5-macos-arm64.tar.gz"
    sha256 "a5d62eb14fd97fbd63414956e6e8a0530110ef29f395103772942d7f7f2dea22"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.7.5/caffeine-4.7.5-linux-x64.tar.gz"
    sha256 "2b1f9eb4a57988cf6a47e93745e4dbf71f4bdc5f4e2de95b4a41176160dfd62f"
  end

  def install
    # Install the full ERTS bundle (VM + libs + wrapper) to libexec
    libexec.install Dir["*"]
    # Symlink the wrapper script into bin so it's on PATH
    bin.install_symlink libexec/"caffeine"
  end

  test do
    system "#{bin}/caffeine", "--version"
  end
end
