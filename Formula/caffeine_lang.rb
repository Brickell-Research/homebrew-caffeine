class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "5.0.0"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v5.0.0/caffeine-5.0.0-macos-x64.tar.gz"
    sha256 "9f7a3fe6a08c8543d5725c17cf7dbf3acedf09c4e1bbac5cf6ab610bad91fb41"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v5.0.0/caffeine-5.0.0-macos-arm64.tar.gz"
    sha256 "c89d7f0f73439870869f6f2d6bb0162be7ba936b7aff5d0d22cae02d8e40decc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v5.0.0/caffeine-5.0.0-linux-x64.tar.gz"
    sha256 "9d8a7ccb3fb09e07b10f656c8e3ce92b3ad0f666559e8652ad099b3d27891df2"
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
