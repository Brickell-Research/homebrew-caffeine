class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.0.14"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.14/caffeine-4.0.14-macos-x64.tar.gz"
    sha256 "c44ff6576b50c7dfa658786a69d1ae6fcbb3667e5a64c6dbb791f7de287ac12c"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.14/caffeine-4.0.14-macos-arm64.tar.gz"
    sha256 "26b8027f75d9b8795123702aa2d8d9594be5abc69f1018c2fdbf81e60d783dbd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.14/caffeine-4.0.14-linux-x64.tar.gz"
    sha256 "4aaffa23d9140b522fb3d9898cbaf734f0f98c42297b1673d4d437495e875514"
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
