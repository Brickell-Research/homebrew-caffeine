class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.3"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.3/caffeine-3.0.3-macos-x64.tar.gz"
    sha256 "01790cd06b20d30ce4e222b036d2c66478cc9779acb5b0937e2e7317b26d4d2d"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.3/caffeine-3.0.3-macos-arm64.tar.gz"
    sha256 "f9d7e6fff7543b5a65a8ab226c84ace09f7cbf3dd7982c37a801aa02feed0c4f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.3/caffeine-3.0.3-linux-x64.tar.gz"
    sha256 "aa42c62e271451bac2c7d1ab8a9306edcb759711e6ee706c7f5d9800bd82915b"
  end

  def install
    # The binary name includes version and platform, rename to just "caffeine"
    if OS.mac? && Hardware::CPU.intel?
      bin.install "caffeine-#{version}-macos-x64" => "caffeine"
    elsif OS.mac? && Hardware::CPU.arm?
      bin.install "caffeine-#{version}-macos-arm64" => "caffeine"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "caffeine-#{version}-linux-x64" => "caffeine"
    end
  end

  test do
    system "#{bin}/caffeine"
  end
end
