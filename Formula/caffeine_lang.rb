class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.23"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.23/caffeine-3.0.23-macos-x64.tar.gz"
    sha256 "f4f500c1823caa55c4c4e88756cb3675ced4b2e1a7172ae59749ea7781b298a1"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.23/caffeine-3.0.23-macos-arm64.tar.gz"
    sha256 "9f8432bbc93125f96deaa6bf6a5f89a823533f971c8001ae3cd08e803ec2c9b7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.23/caffeine-3.0.23-linux-x64.tar.gz"
    sha256 "b6ca3b277b1a60321e6b455e2bf3c376516cf7bddef0fd3e52352ca9cb6c9760"
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
