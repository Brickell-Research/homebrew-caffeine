class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.13"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.13/caffeine-3.0.13-macos-x64.tar.gz"
    sha256 "0f1a62cad9eafcf7dc9c00dc2fcb827fdfe74998d3507881d4f6dc2871f5a61d"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.13/caffeine-3.0.13-macos-arm64.tar.gz"
    sha256 "1fcbda44d4c795439d3fe56b27550c4d7ff5c76afa822d690a16b43c1b8d3fdd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.13/caffeine-3.0.13-linux-x64.tar.gz"
    sha256 "731efeae61924a672ea09e9b53d73f5415825fa40365ca0b22cabbd553d97b45"
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
