class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.7.7"

  # Platform-specific downloads (each tarball contains ERTS + compiled BEAM files)
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.7.7/caffeine-4.7.7-macos-x64.tar.gz"
    sha256 "3e5b9c5ba1031ce85615fc221d7d4c955df1cffb0efe1edd198708529faa3432"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.7.7/caffeine-4.7.7-macos-arm64.tar.gz"
    sha256 "c26922f154bd39ce8751a6b47b0ac3fb594713ea2a9115ddc574a460f801e6c0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.7.7/caffeine-4.7.7-linux-x64.tar.gz"
    sha256 "752a63327471c2ba0ec2facf2a1e9487905f17db6ec2eca64e913d3aa1f497f4"
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
