class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "0.2.17"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.17/caffeine-0.2.17-macos-x64.tar.gz"
    sha256 "a447d6cdddf8a9d2ceda941bba7989039481d57091e1822938829a9924fdaba2"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.17/caffeine-0.2.17-macos-arm64.tar.gz"
    sha256 "c3b7b9b6c703b2f222efa6e87f34c5d147e002f88581e283a56b36b8656ac045"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.17/caffeine-0.2.17-linux-x64.tar.gz"
    sha256 "7855cda4781c4424b0efcbed6ce08b588859b778ef4fbb93d3667709519519cc"
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
