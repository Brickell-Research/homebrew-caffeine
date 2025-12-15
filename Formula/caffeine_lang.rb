class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "1.0.1"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v1.0.1/caffeine-1.0.1-macos-x64.tar.gz"
    sha256 "1b257549172b18e84783334a83f9c3f12b0d7b6292046939c1db6729e5f3b920"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v1.0.1/caffeine-1.0.1-macos-arm64.tar.gz"
    sha256 "169eb814307e02c7d038a133b984261a63819bdd43bf2f885ae7b7ec7f20ae6d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v1.0.1/caffeine-1.0.1-linux-x64.tar.gz"
    sha256 "485dea48d030ba5c4904280f71342105d25016d771685aa07a180037adf77a2c"
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
