class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.18"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.18/caffeine-3.0.18-macos-x64.tar.gz"
    sha256 "2feeb3c4e891ed8653c3735931fc914e899b241741a0d7af52612416d0dce548"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.18/caffeine-3.0.18-macos-arm64.tar.gz"
    sha256 "443678a28592ddd70519f0bfad62454ebb92675e436c67b15767b1b7210c8296"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.18/caffeine-3.0.18-linux-x64.tar.gz"
    sha256 "2891ce6171ed1129c9e2d563a7cf23f170f3ad443a725e916fcd7ecd4e3fd0c9"
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
