class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.3.5"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.3.5/caffeine-4.3.5-macos-x64.tar.gz"
    sha256 "077816bafd2b140e19ea51d4efb6219989d4b3940ceef05866b758dde1b95a77"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.3.5/caffeine-4.3.5-macos-arm64.tar.gz"
    sha256 "c68e50a3d5843b3c4e35a5c7fe584beed2bbad72d84394f04e1499fcc05113b2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.3.5/caffeine-4.3.5-linux-x64.tar.gz"
    sha256 "2e670f1c50f46ab8301b216b14a15dc1c521172a05e293b0b01fb0b85128296e"
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
