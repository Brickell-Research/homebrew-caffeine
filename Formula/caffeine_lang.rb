class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.7.6"

  # Platform-specific downloads (each tarball contains ERTS + compiled BEAM files)
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.7.6/caffeine-4.7.6-macos-x64.tar.gz"
    sha256 "230226e2fc2c3550e40718ddc76f8d132e3bf0bea3b2af008c7262a982df71f5"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.7.6/caffeine-4.7.6-macos-arm64.tar.gz"
    sha256 "281a6ff471c820773fe591298252aba5e9c81dac3204e822c97784965b916de2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.7.6/caffeine-4.7.6-linux-x64.tar.gz"
    sha256 "ccdfb51eda3975e6efefe2b6062f40a27027dd687a1ed9c61dabf045f8950e72"
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
