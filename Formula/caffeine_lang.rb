class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.0.7"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.7/caffeine-4.0.7-macos-x64.tar.gz"
    sha256 "cd1e2fd8c7600fb931362490ca0c148950c906e524b499f5e707f51b15c02c1e"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.7/caffeine-4.0.7-macos-arm64.tar.gz"
    sha256 "4f02b414a50208670797e93c7119411e1cb8cfdab71eb95ec9b291e9e231725e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.7/caffeine-4.0.7-linux-x64.tar.gz"
    sha256 "efa04b78edc38308ed43b5c37abd3e9e8e28b1cb8aa00aed4b9e401580d2c365"
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
