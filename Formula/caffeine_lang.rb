class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.26"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.26/caffeine-3.0.26-macos-x64.tar.gz"
    sha256 "0db2a637c726ec051961851d82dbaa5ece668c2ca9e7b7f35d46f37cb3e361da"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.26/caffeine-3.0.26-macos-arm64.tar.gz"
    sha256 "92d85accf2bcedd57e58daa66c21774f8bae9f4c8db1178f1b91819ef7e0c1cc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.26/caffeine-3.0.26-linux-x64.tar.gz"
    sha256 "6003870e27f7048fa0dd336b22e6020729a0cd25f16285f621d97f5ed9041d74"
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
