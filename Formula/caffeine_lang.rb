class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "6.1.0"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.1.0/caffeine-6.1.0-macos-x64.tar.gz"
    sha256 "a23474f8d7b62cbf44df6dafd354f88acb7b11ff99b416b5fca9a895c0408b77"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.1.0/caffeine-6.1.0-macos-arm64.tar.gz"
    sha256 "9d9c8f131eb9eabdf4a1cf30d99d38082b5e8d7601b4cb24d5b7d306d84bcfa7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.1.0/caffeine-6.1.0-linux-x64.tar.gz"
    sha256 "36f3c8da9e63ef7cb915d6ac512dbafbc3ef09dcf0eba117625333497d2e8c23"
  end

  def install
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
