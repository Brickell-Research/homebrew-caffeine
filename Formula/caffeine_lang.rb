class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.0.0"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.0/caffeine-4.0.0-macos-x64.tar.gz"
    sha256 "a168cd8ca2798eb8e62c676e40dc36587c17e68a1b9e4faa6c026547330aa2b0"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.0/caffeine-4.0.0-macos-arm64.tar.gz"
    sha256 "5c542f0bc5b4e9ce35c849ee6182e66c580a173fc061f499e1af13697f49d37b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.0/caffeine-4.0.0-linux-x64.tar.gz"
    sha256 "a76bc78d71ed5bdff3ea88c17855ebf65df10303614a90994a78ce2c02692c23"
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
