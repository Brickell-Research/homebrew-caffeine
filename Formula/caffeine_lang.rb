class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  version "0.2.15"
  license "GPL-3.0-only"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.15/caffeine-0.2.15-macos-x64.tar.gz"
    sha256 "d8a3631d4487c514ad440d4efce97450b72c6e22fdaa157f9fe7b8ed7d333d80"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.15/caffeine-0.2.15-macos-arm64.tar.gz"
    sha256 "3a499b340ce782b8420d628ab6ff00be144a97ab7c0c550c2083759a6ce48423"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.15/caffeine-0.2.15-linux-x64.tar.gz"
    sha256 "9970a4f5a50ee0859b780864faf3a06cb8081af950fa395d19fece3a3497dd88"
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
