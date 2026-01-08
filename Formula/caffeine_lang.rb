class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "2.0.5"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.5/caffeine-2.0.5-macos-x64.tar.gz"
    sha256 "b8fbae8575f2b308d53690a972c37c64b0120e23817873206a3c7889614ed863"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.5/caffeine-2.0.5-macos-arm64.tar.gz"
    sha256 "229c6478e02907794be51c558aa4be4122b4212a972c1d3a5d36b31e5e4701e5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.5/caffeine-2.0.5-linux-x64.tar.gz"
    sha256 "51d69825823e4ab2d003fe9e0a724c7b37fdb0cc16bd9d67a59564727462c59d"
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
