class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.6.5"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.6.5/caffeine-4.6.5-macos-x64.tar.gz"
    sha256 "eb82bb68340e0d0336131ef93ad973ba2c3f51272a3fb74d36ee6c0a7cdd2ed7"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.6.5/caffeine-4.6.5-macos-arm64.tar.gz"
    sha256 "9f8c44cba255de18c58e8e193cd922cbd2231cd18d5fae35a5cb6307c6a86433"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.6.5/caffeine-4.6.5-linux-x64.tar.gz"
    sha256 "5632ceea6a273dbae0f222589bf9f2e90a9369f47622127216a7dacffdfb5b03"
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
