class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.3.3"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.3.3/caffeine-4.3.3-macos-x64.tar.gz"
    sha256 "7235d048d1190c3928e5f967a365696ff479b39261c2050d26064f17b28c0e00"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.3.3/caffeine-4.3.3-macos-arm64.tar.gz"
    sha256 "41c6443271d34a55d79d4e7640d277466a55a7af2d9397d5a189a7f1cb197b9b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.3.3/caffeine-4.3.3-linux-x64.tar.gz"
    sha256 "2aae0488eb9ae91893a0fa036cf79913ba0497dbca87be6bf4c3799bc33ce950"
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
