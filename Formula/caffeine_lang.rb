class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.8.1"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.8.1/caffeine-4.8.1-macos-x64.tar.gz"
    sha256 "639251c24deb358c406c7e8a516341849d1b11ab36070a6809f8103c9c443457"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.8.1/caffeine-4.8.1-macos-arm64.tar.gz"
    sha256 "b365d5cd79370dbc4129c15840535550ed5f6ff21e0bd141e41a82af6e5d2570"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.8.1/caffeine-4.8.1-linux-x64.tar.gz"
    sha256 "e886c4f61da566c3222757abf556f76fea7922f7be4999d532c5bab45f330056"
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
