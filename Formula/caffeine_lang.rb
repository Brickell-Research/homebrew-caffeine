class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.8.2"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.8.2/caffeine-4.8.2-macos-x64.tar.gz"
    sha256 "5179d583975ae7d440dca1cbe2b1ac5e1da4435da490338755e9b2f67dfe63e3"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.8.2/caffeine-4.8.2-macos-arm64.tar.gz"
    sha256 "0091f3a1d9a6e4a7ca965a88d0523c8fc72ac93013687d0c2910e8a9ff4f0d29"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.8.2/caffeine-4.8.2-linux-x64.tar.gz"
    sha256 "93b67e28a6c47975cdf9138d4fce686272c0f6b7113b45a12c32412f90a81f28"
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
