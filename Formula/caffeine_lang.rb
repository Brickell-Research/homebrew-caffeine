class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.0.15"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.15/caffeine-4.0.15-macos-x64.tar.gz"
    sha256 "1edb6bce7350a960142f4f53b13375e3a3be2c4df5959a677e1f0fd5f6da417c"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.15/caffeine-4.0.15-macos-arm64.tar.gz"
    sha256 "4c17a999ba40f103736bbee3b82b26a452cd82e1773ae8b4cfcc0b5a0603f8fd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.15/caffeine-4.0.15-linux-x64.tar.gz"
    sha256 "e5356b9382137980abdee0fdf468f2020c6e9233946ff1a6f96e671b1f7554f0"
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
