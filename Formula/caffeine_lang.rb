class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.7.8"

  # Platform-specific downloads (each tarball contains ERTS + compiled BEAM files)
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.7.8/caffeine-4.7.8-macos-x64.tar.gz"
    sha256 "035343a980fad1fbe82887d72974e2e315798ca68f43ccca68680c346cf86cd7"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.7.8/caffeine-4.7.8-macos-arm64.tar.gz"
    sha256 "bfbde8748a2c02a1b3e9ae5a5ba7150260e059d42a3a8fd6ca277a0e337bc112"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.7.8/caffeine-4.7.8-linux-x64.tar.gz"
    sha256 "75305715e07bcb629dd93a148c287ce5f8f1f1c2c1755ab8e73fb65b70d50d75"
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
