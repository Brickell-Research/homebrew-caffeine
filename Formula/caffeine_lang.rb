class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.18"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.18/caffeine-3.0.18-macos-x64.tar.gz"
    sha256 "e78ca719fd14b5646d40b0f150952f3cc073b7a2141f1a3d50a68890bbb6bee0"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.18/caffeine-3.0.18-macos-arm64.tar.gz"
    sha256 "92223b1f8b7f25af05a7772f00334babd6b5e69be8f0320ac16f5e5e1d5f2398"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.18/caffeine-3.0.18-linux-x64.tar.gz"
    sha256 "868de1672accaa0404a83b4cca919c1cb082352621bde0a15f39bc7e2cc63b97"
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
