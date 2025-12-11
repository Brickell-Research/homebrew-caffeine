class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  version "0.2.7"
  license "GPL-3.0-only"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.7/caffeine-0.2.7-macos-x64.tar.gz"
    sha256 "bacc8b8ea64c5b9b980a4ace47cfb1f081e70e866cac668a0ac1560fa9d441ed"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.7/caffeine-0.2.7-macos-arm64.tar.gz"
    sha256 "c9e831ae98a2454f619fe07adfc4f4f79b2aeefe16e700fe9423aad3b8aabc5b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.7/caffeine-0.2.7-linux-x64.tar.gz"
    sha256 "923502e26a45d1954ef8577bd60aac2d75a66c5508f038c7dad3a228764f0cb4"
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
