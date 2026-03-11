class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.7.9"

  # Platform-specific downloads (each tarball contains ERTS + compiled BEAM files)
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.7.9/caffeine-4.7.9-macos-x64.tar.gz"
    sha256 "ed1b15806f042b3a9d50f6b0b9ba10d64e6e74150a95f857174425de5b96da5f"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.7.9/caffeine-4.7.9-macos-arm64.tar.gz"
    sha256 "837f3dea2c719094cbb5830be09605f43530502f18a061f07541cbddc592a0ad"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.7.9/caffeine-4.7.9-linux-x64.tar.gz"
    sha256 "14e4eca8e84ca840bd55de4caccc67ab1d4e62f8229355c5cc59ae8f93425cb1"
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
