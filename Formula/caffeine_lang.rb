class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  version "0.2.10"
  license "GPL-3.0-only"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.10/caffeine-0.2.10-macos-x64.tar.gz"
    sha256 "6841a1dee3232cfc7e637ca2df511db6c326301a392381a50e747cf763ec46e4"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.10/caffeine-0.2.10-macos-arm64.tar.gz"
    sha256 "b4e067fc5ea53b3ca02666b276d860c68d50d544c6ee842dd0b9a4de6e6d7ac6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.10/caffeine-0.2.10-linux-x64.tar.gz"
    sha256 "b4c87a9df8daa6102610360b73a6e7ff5753d559e873f804ac65fdd4e60be5c9"
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
