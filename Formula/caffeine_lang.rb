class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.17"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.17/caffeine-3.0.17-macos-x64.tar.gz"
    sha256 "ac523fcb29daf6e000490db84603171b2ce69ed68ce674e3ffed6e61f9ee08bf"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.17/caffeine-3.0.17-macos-arm64.tar.gz"
    sha256 "4d988c762e5131c389c4a8c1ea5dda276bbe38c6f9503df33d26714407406976"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.17/caffeine-3.0.17-linux-x64.tar.gz"
    sha256 "77f014c5fe936c01bcaf184292940575fd955254c378f354d6e0b99bb1bbaa2e"
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
