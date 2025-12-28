class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "2.0.1"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.1/caffeine-2.0.1-macos-x64.tar.gz"
    sha256 "6571477be6d899d073a7e9edf45049d5ebd2cdd340ee3ed83a82503ffaa2c092"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.1/caffeine-2.0.1-macos-arm64.tar.gz"
    sha256 "5619f3beb0fe2480df380394e1e56d6dc2daf41221e254a25fb38f96fc071e80"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.1/caffeine-2.0.1-linux-x64.tar.gz"
    sha256 "b11534ce65b357c884e1fba80f5f270c793f6e6dacd4b2a98a9f318614c8ffa9"
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
