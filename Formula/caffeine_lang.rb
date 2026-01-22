class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.6"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.6/caffeine-3.0.6-macos-x64.tar.gz"
    sha256 "ebc8ff81006417f9772deba47c7324e26b39483d876a7c7d2c63ec7b75ec2315"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.6/caffeine-3.0.6-macos-arm64.tar.gz"
    sha256 "627584cf580a5c71a00814982ee661eb9f7645313a5313e08f43efad551815de"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.6/caffeine-3.0.6-linux-x64.tar.gz"
    sha256 "9dc44d97e5e46932ab81d8fe8e5011fcc96cff94cd43ae76644ccac3a8f4e3ad"
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
