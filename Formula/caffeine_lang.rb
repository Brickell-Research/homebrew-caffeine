class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.21"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.21/caffeine-3.0.21-macos-x64.tar.gz"
    sha256 "12ffa2b0966e99bf22960f1ddb646bf02ffb10c3aaf05c47fa8831b123635542"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.21/caffeine-3.0.21-macos-arm64.tar.gz"
    sha256 "bd9b69452391fe55918c1f769b6c992066633b599d5705bd4dc1b7f0529e10d4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.21/caffeine-3.0.21-linux-x64.tar.gz"
    sha256 "fee6a689b10d3987becfe9567d243e0f0e4ba828295d051872c1b581e5090913"
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
