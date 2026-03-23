class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "5.0.5"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v5.0.5/caffeine-5.0.5-macos-x64.tar.gz"
    sha256 "74839935af44e58477cd5d1dfb60d7db1bf2b1232dfe8662c9081e2614339f39"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v5.0.5/caffeine-5.0.5-macos-arm64.tar.gz"
    sha256 "bbb749bf6973c2c89ef4c6e58b5ba7f32a141d242a4885aaad1bd2edcdbf9c42"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v5.0.5/caffeine-5.0.5-linux-x64.tar.gz"
    sha256 "83543a2c421e4ff097e22afeb64df750a78320b9c56eb7a32758aaf537338dad"
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
