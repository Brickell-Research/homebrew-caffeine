class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  version "0.2.14"
  license "GPL-3.0-only"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.14/caffeine-0.2.14-macos-x64.tar.gz"
    sha256 "0f8446504af8e688f859f77608f1b3a5997aba9055de95fb171bfb4e63c3af34"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.14/caffeine-0.2.14-macos-arm64.tar.gz"
    sha256 "4ce26b8e1876246dd72b625f25b5ff1307f68c1bd92c3756273f59d2a4b18460"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.14/caffeine-0.2.14-linux-x64.tar.gz"
    sha256 "e2750447ca67feb11ab867633847e079b0fa3d15ce6b02e4a207bf86ca745c9d"
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
