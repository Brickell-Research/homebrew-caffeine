class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  version "0.2.12"
  license "GPL-3.0-only"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.12/caffeine-0.2.12-macos-x64.tar.gz"
    sha256 "d2c36cb42791aac600310ad39ae3bc5dafe879ab91d3b476a0e7b87d468a23e1"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.12/caffeine-0.2.12-macos-arm64.tar.gz"
    sha256 "23a0cce33e5c3bb8bb93266b2819af8b6b988d96eb8231a945087fbc1d6daad4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.12/caffeine-0.2.12-linux-x64.tar.gz"
    sha256 "5ff78c1f0bd44b8e3ce2c1af3d3c73253e077308aa1061fd26385ca32e5a1f40"
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
