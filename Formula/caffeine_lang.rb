class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.6.0"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.6.0/caffeine-4.6.0-macos-x64.tar.gz"
    sha256 "ab42d5908567310ccc166b9475b71d82ebd3c2973b8a532569691da7ecadc358"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.6.0/caffeine-4.6.0-macos-arm64.tar.gz"
    sha256 "96d8a4a786592c89cb9f3aeebd3c8e5f5a181e749db2ea1ed32b0139a719842f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.6.0/caffeine-4.6.0-linux-x64.tar.gz"
    sha256 "b25984dadfa099736a9e6cbe403431639fe6c9aae135008eceaf39ff4bce3819"
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
