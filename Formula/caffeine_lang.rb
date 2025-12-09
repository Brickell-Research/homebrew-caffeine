class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  version "0.2.0"
  license "GPL-3.0-only"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.0/caffeine-0.2.0-macos-x64.tar.gz"
    sha256 "ae1159b7bc96250a7cabed22da8caa0e40a9332c61dd2ba0c53a42ce1c62cafb"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.0/caffeine-0.2.0-macos-arm64.tar.gz"
    sha256 "3604a405dfe51932462cd1b3104ccba7585995ff8f3334d338cd796b6f6c23f4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.0/caffeine-0.2.0-linux-x64.tar.gz"
    sha256 "6d9fd56f4104ec960120232e62afdadfff259543b818c1ee6a82179fefb28da4"
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
